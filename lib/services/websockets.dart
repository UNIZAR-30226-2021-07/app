import 'package:gatovidapp/services/models.dart';
import 'package:socket_io_client/socket_io_client.dart';

Socket socket;

String token = globalToken.token;

void startWebSocket() {
  // Builder
  socket = io(
      'http://gatovid.herokuapp.com:80',
      OptionBuilder()
          .setTransports(['websocket']) // for Flutter or Dart VM
          .enableAutoConnect()
          .setExtraHeaders({'Authorization': 'Bearer $token'})
          .enableForceNew()
          .enableForceNewConnection() // optional
          .enableReconnection()
          .build());
  // Handler for each event:
  // socket.on('event', handler);
  print(socket);
  socket.on('connect', (_) => print('connect: ' + _.toString()));
  socket.on('disconnect', (_) => print('disconnect: ' + _.toString()));
  socket.on('chat', (data) => chatReceivedHandler(data));
  socket.on('start_game', (_) => startGameHandler());
  socket.on('create_game', (data) => createGameHandler(data));
  socket.on('game_owner', (_) => gameOwnerHandler());
  socket.on('found_game', (data) => publicGameHandler(data));
  socket.on('game_cancelled', (_) => gameCancelledHandler());
  socket.on('users_waiting', (data) => usersWaitingHandler(data));
  socket.on('game_update', (data) => gameUpdateHandler(data));
  socket.on('connect_error', (_) => print('errorConnect: ' + _.toString()));
  socket.on('error', (data) => errorMessageHandler(data));
}

// Handlers for socket.on

void chatReceivedHandler(Map<String, dynamic> json) {
  controllerChat.add(true);
  print('Received: ' + json.toString());
  messages.insert(0, Message.fromJson(json));
}

void startGameHandler() {
  print('Received: StartGame');
  controllerStartGame.add(true);
}

void createGameHandler(Map<String, dynamic> json) {
  codeGame = json['code'];
  controllerCreateGame.add(true);
  print('Received: ' + json.toString());
}

void publicGameHandler(Map<String, dynamic> json) {
  codeGame = json['code'];
  print('Received: ' + json.toString());
  joingGame(codeGame);
}

void gameOwnerHandler() {
  print('Received: I\'m the captain now');
  controllerCreateGame.add(true); // Pop-up of owner
}

void gameCancelledHandler() {
  print('Received: game_cancelled');
  controllerStartGame.add(false);
  globalError = Error(
      error:
          'No se ha podido encontrar una partida, por favor, intentelo de nuevo');
}

void usersWaitingHandler(int data) {
  print('usersWaiting received');
  print('Received: ' + data.toString());
  numGamers = data;
  controllerUsersWaiting.add(false);
}

void gameUpdateHandler(Map<String, dynamic> json) {
  print('Received: update_game');
  print(json.toString());

  if (json['finished'] != null) {
    // TODO: Logica de que se ha acabado la partida
    // Habrá que leer tmb leaderboard y playtime_mins
  }
  if (json['current_turn'] != null) {
    currentTurnPlayer = json['current_turn'];
    print('El turno es de ->' + currentTurnPlayer);
    if (currentTurnPlayer == globalData.name) {
      isMyTurn = true;
    } else {
      isMyTurn = false; // not player turn
      notAgain = true;
    }
  }
  if (json['players'] != null) {
    List aux = json['players'];
    if (listOfGamers.length <= 0) {
      for (int i = 0; i < aux.length; i++) {
        if (aux[i]['name'].toString() != globalData.name) {
          listOfGamers.add(
              GamePlayer(aux[i]['name'], aux[i]['name'], aux[i]['picture']));
          listOfGamersBody[aux[i]['name']] = [[], [], [], []];
        }
      }
    } else {
      List previousList = [];
      for (int i = 0; i < aux.length; i++) {
        if (aux[i]['is_ai'] != null) {
          print(aux[i]['name'].toString());
          previousList.add(GamePlayer(aux[i]['name'].toString(),
              aux[i]['name'].toString() + ' [BOT]', aux[i]['picture']));
        } else {
          for (int j = 0; j < listOfGamers.length; j++) {
            if (aux[i]['name'].toString() != globalData.name) {
              if (aux[i]['name'].toString() == listOfGamers[j].name) {
                previousList.add(GamePlayer(
                    aux[i]['name'], aux[i]['name'], listOfGamers[j].pictureId));
                break;
              }
            }
          }
        }
      }
      listOfGamers.clear();
      listOfGamers = previousList;
    }
  }
  if (json['hand'] != null) {
    List aux = json['hand'];
    handOfPlayer.clear();
    for (int i = 0; i < aux.length; i++) {
      print('------------------------------------------------------------');
      print(aux.toString());
      print('------------------------------------------------------------');
      // Is a treatment type
      if (aux[i]['treatment_type'] == null) {
        handOfPlayer.add(CardData(aux[i]['card_type'], aux[i]['color'], '', i));
      }
      // Is not a treatment type
      else {
        handOfPlayer.add(
            CardData(aux[i]['card_type'], '', aux[i]['treatment_type'], i));
      }
    }
  }
  if (json['bodies'] != null) {
    Map<String, dynamic> aux = json['bodies'];
    // Upgrade all the bodies of the rest of players
    for (int i = 0; i < listOfGamers.length; i++) {
      // There's an upgrade
      if (aux[listOfGamers[i].name] != null) {
        // At this point we have to extract organs and identifiers
        listOfGamersBody[listOfGamers[i].name].clear();
        print(listOfGamersBody[listOfGamers[i].name]);
        // List of stacks that we receive
        List aux2 = aux[listOfGamers[i].name];
        for (int j = 0; j < aux2.length; j++) {
          listOfGamersBody[listOfGamers[i].name].add([]);
          // We trust in backend so much at this point
          // organ
          if (aux2[j]['organ'] != null) {
            listOfGamersBody[listOfGamers[i].name][j].add(CardData(
                aux2[j]['organ']['card_type'],
                aux2[j]['organ']['color'],
                '',
                -1));
          }
          // Modifiers
          if (aux2[j]['modifiers'] != null) {
            List aux3 = aux2[j]['modifiers'];
            if (aux3.length > 0) {
              for (int k = 0; k < aux3.length; k++) {
                listOfGamersBody[listOfGamers[i].name][j].add(
                    CardData(aux3[k]['card_type'], aux3[k]['color'], '', -1));
              }
            }
          }
        }
      }
    }
    if (aux[globalData.name] != null) {
      // At this point we have to extract organs and identifiers
      bodyOfPlayer.clear();
      // List of stacks that we receive
      List aux2 = aux[globalData.name];
      for (int i = 0; i < aux2.length; i++) {
        bodyOfPlayer.add([]);
        // We trust in backend so much at this point
        // organ
        if (aux2[i]['organ'] != null) {
          bodyOfPlayer[i].add(CardData(aux2[i]['organ']['card_type'],
              aux2[i]['organ']['color'], '', -1));
          if (aux2[i]['modifiers'] != null) {
            List aux3 = aux2[i]['modifiers'];
            if (aux3.length > 0) {
              for (int j = 0; j < aux3.length; j++) {
                bodyOfPlayer[i].add(
                    CardData(aux3[j]['card_type'], aux3[j]['color'], '', -1));
              }
            }
          }
        }
      }
    }
  }
  if (json['paused'] != null) {
    if (json['paused'] == true) {
      playerWhoPaused = json['paused_by'];
      if (playerWhoPaused != globalData.name) {
        controllerPausedGame.add(true);
      } else {
        controllerPausedGameMe.add(true);
      }
    } else {
      // false
      if (playerWhoPaused != globalData.name) {
        controllerPausedGame.add(false);
      } else {
        controllerPausedGameMe.add(false);
      }
    }
  }
  controlGame.add(true);
}

void errorMessageHandler(Map<String, dynamic> json) {
  if (json['error'] != null) {
    print('Received error: ' + json.toString());
    controllerStartGame.add(
        false); // If the error is from create private or public, it works too
    globalError = Error.fromJson(json);
  }
}

// Functions to send data with the websocket

void createGame() {
  print('create_game emit');
  socket.emitWithAck('create_game', null,
      ack: (data) => errorMessageHandler(data));
}

void startGame() {
  print('start_game emit');
  socket.emitWithAck('start_game', null,
      ack: (data) => errorMessageHandler(data));
}

void publicGame() {
  print('search_game emit');
  socket.emitWithAck('search_game', null,
      ack: (data) => errorMessageHandler(data));
}

void sendMessageWebSocket(String message) {
  print('chat emit');
  socket.emitWithAck('chat', message, ack: (data) => errorMessageHandler(data));
}

void joingGame(String code) {
  print('join emit');
  socket.emitWithAck('join', code, ack: (data) => errorMessageHandler(data));
}

void leaveGame() {
  print('leave emit');
  socket.emitWithAck('leave', null, ack: (data) => errorMessageHandler(data));
}

void stopSearchingPublic() {
  print('stop_searching emit');
  socket.emitWithAck('stop_searching', null,
      ack: (data) => print('stop_searching ack received'));
}

void passTurn() {
  print('play_pass emit');
  socket.emitWithAck('play_pass', null,
      ack: (data) => print('play_pass ack received: ' + data.toString()));
}

void discardCard(int slot) {
  print('play_discard emit-> slot: ' + slot.toString());
  print('Card Type: ' + handOfPlayer[slot].cardType.toString());
  socket.emitWithAck('play_discard', slot,
      ack: (data) => print('play_discard error:' + data.toString()));
}

void playCard(String target, int organPile, CardData cardPlayed) {
  // Treatment type
  if (cardPlayed.cardType == 'treatment') {
    if (cardPlayed.treatmentType == 'transplant') {
      if (playerSelectedtransplant == '') {
        print('transplant first target ' + target);
        playerSelectedtransplant = target;
        pileplayerSelectedtransplant = organPile;
      } else {
        socket.emitWithAck(
            'play_card',
            {
              'slot': cardPlayed.indice,
              'target1': playerSelectedtransplant,
              'target2': target,
              'organ_pile1': pileplayerSelectedtransplant,
              'organ_pile2': organPile,
            },
            ack: (data) =>
                print('PlayCard transplant error:' + data.toString()));
        playerSelectedtransplant = '';
      }
    } else if (cardPlayed.treatmentType == 'organ_thief') {
      // TODO: FALTA POR PROBAR
      print('organ_thief target ' + target);
      socket.emitWithAck(
          'play_card',
          {
            'slot': cardPlayed.indice,
            'target': target,
          },
          ack: (data) =>
              print('PlayCard organ_thief error:' + data.toString()));
      playerSelectedtransplant = '';
    } else if (cardPlayed.treatmentType == 'infection') {
      print('infection');
      socket.emitWithAck(
          'play_card',
          {
            'slot': cardPlayed.indice,
          },
          ack: (data) =>
              print('PlayCard medical_error error:' + data.toString()));
    } else if (cardPlayed.treatmentType == 'latex_glove') {
      playedGloves = true;
      socket.emitWithAck(
          'play_card',
          {
            'slot': cardPlayed.indice,
          },
          ack: (data) =>
              print('PlayCard medical_error error:' + data.toString()));
    } else if (cardPlayed.treatmentType == 'medical_error') {
      socket.emitWithAck(
          'play_card',
          {
            'slot': cardPlayed.indice,
            'target': target,
          },
          ack: (data) =>
              print('PlayCard medical_error error:' + data.toString()));
    } else {
      print('we have a problem' +
          cardPlayed.cardType +
          " " +
          cardPlayed.treatmentType +
          " ");
    }
  }
  // Regular type
  else {
    socket.emitWithAck(
        'play_card',
        {
          'slot': cardPlayed.indice,
          'target': target,
          'organ_pile': organPile,
        },
        ack: (data) => print('PlayCard error:' + data.toString()));
  }
}

void gamePaused(bool pause) {
  print('pause_game emit');
  socket.emitWithAck('pause_game', pause,
      ack: (data) => print('pause_game error:' + data.toString()));
}

void disconnectWebSocket() {
  try {
    //socket.clearListeners();
    socket.disconnect();
    //socket.close();
    //socket.destroy();
    //socket.dispose();
    //socket=null;
    print('SOCKET DISCONNECTED');
  } catch (e) {
    print(e);
  }
}

class Message {
  final String sender;
  final String text;

  Message({
    this.sender,
    this.text,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(sender: json['owner'], text: json['msg']);
  }
}

// Empty list
List<Message> messages = [];
