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

  if (json['finished'] != null){
    //TODO: Logica de que se ha acabado la partida
    // Habrá que leer tmb leaderboard y playtime_mins
  }
  if (json['current_turn'] != null){
    // TODO: Logica de los turnos
    currentTurnPlayer = json['current_turn'];
  }
  if (json['players'] != null){
    List aux = json['players'];
    listOfGamers.clear(); // Clean of the list
    for(int i=0; i < aux.length; i++){
      if (aux[i]['name'].toString() != globalData.name){
        listOfGamers.add(GamePlayer(aux[i]['name'], aux[i]['picture']));
      }
    }
  }
  if (json['hand'] != null){
    List aux = json['hand'];
    handOfPlayer.clear();
    for(int i=0; i < aux.length; i++){
      // Is a treatment type
      if (aux[i]['treatment_type'] == null){
        handOfPlayer.add(CardData(aux[i]['card_type'], aux[i]['color'], ''));
      }
      // Is not a treatment type
      else{
        handOfPlayer.add(CardData(aux[i]['card_type'], aux[i]['color'], aux[i]['treatment_type']));
      }
    }
  }

  /*
  * Lectura del json recibido
  * */

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
