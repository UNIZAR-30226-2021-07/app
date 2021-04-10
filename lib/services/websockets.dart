import 'package:flutter/cupertino.dart';
import 'package:gatovidapp/services/models.dart';
import 'package:socket_io_client/socket_io_client.dart';

Socket socket;

String token = globalToken.token;

void startWebSocket(){
  // Builder
  socket = io('http://gatovid.herokuapp.com:80',
      OptionBuilder()
          .setTransports(['websocket']) // for Flutter or Dart VM
          .disableAutoConnect()  // disable auto-connection
          .setExtraHeaders({'Authorization': 'Bearer $token'}) // optional
          .build());
  // Connect socket
  socket.connect();
  // Handler for each event:
  // socket.on('event', handler);
  print(socket);
  socket.on('connect', (_) => print('connect: '+_.toString()));
  socket.on('chat', (data) => chatReceivedHandler(data));
  socket.on('start_game', (_) => startGameHandler());
  socket.on('create_game', (data) => createGameHandler(data));
  socket.on('connect_error', (_) => print('errorConnect: '+_.toString()));
  socket.on('error', (data) => errorMessageHandler(data)); // Probably the problem will be with the tokens
}

// Handlers for socket.on

void chatReceivedHandler(Map <String, dynamic> json){
  controllerChat.add(true);
  print('Received: ' + json.toString());
  messages.insert(0,Message.fromJson(json));
}

void errorMessageHandler(Map <String, dynamic> json){
  print(json.toString());
  print('Received: ' + json.toString());
  controllerStartGame.add(false); // If the error is from create private or public, it works too
  globalError = Error.fromJson(json);
}

void createGameHandler(Map <String, dynamic> json){
  codeGame = json['code'];
  controllerCreateGame.add(true);
  print('Received: ' + json.toString());
}

void startGameHandler(){
  print('Received: StartGame');
  controllerStartGame.add(true);
}

// Functions to send data with the websocket

void createGame(){
  print('create_game emit');
  socket.emit('create_game');
}

void startGame(){
  print('start_game emit');
  socket.emit('start_game');
}

void sendMessageWebSocket(String message){
  print('chat emit');
  socket.emit('chat', message);
}

void joingGame(String code){
  print('join emit');
  socket.emit('join', code);
}

void leaveGame(){
  print('leave emit');
  socket.emit('leave');
}

void disconnectWebSocket(){
  print('disconnect emit');
  socket.emit('disconnect', '');
}

class Message {
  final String sender;
  final String text;

  Message({
    this.sender,
    this.text,
  });

  factory Message.fromJson(Map<String,dynamic> json) {
    return Message(sender: json['owner'], text: json['msg']);
  }
}

// Empty list
List<Message> messages = [];
