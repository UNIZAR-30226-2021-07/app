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
  socket.on('chat', (data) => chatReceived(data));
  socket.on('start_game', (_) => startGame());
  socket.on('connect_error', (_) => print('errorConnect: '+_.toString()));
  socket.on('error', (data) => errorMessage(data)); // Probably the problem will be with the tokens
}

// Handlers for socket.on

void chatReceived(Map <String, dynamic> json){
  controllerChat.add(true);
  print('Received' + json.toString());
  messages.insert(0,Message.fromJson(json));
}

void errorMessage(Map <String, dynamic> json){
  print(json.toString());
  controllerStartGame.add(false);
  globalError = Error.fromJson(json);
}

void startGame(){
  controllerStartGame.add(true);
}


// Functions to send data with the websocket

void sendMessageWebSocket(String message){
  socket.emit('chat', message);
}

void joingGame(String code){
  socket.emit('join', code);
}

void leaveGame(){
  socket.emit('leave');
}

void disconnectWebSocket(){
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
