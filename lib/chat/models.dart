import 'package:socket_io_client/socket_io_client.dart';
import 'dart:async';

String token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTYxNzc0MTMwNiwianRpIjoiOTkzNjdhNWQtZmI1OS00ZWY3LWJjMDUtMzdkMjE0MTQ4ZjIzIiwibmJmIjoxNjE3NzQxMzA2LCJ0eXBlIjoiYWNjZXNzIiwic3ViIjoidGVzdF91c2VyMkBnbWFpbC5jb20iLCJleHAiOjE2MTc3NDIyMDZ9.FnPyXFAeSiBn8unoJvaDzNM130HxvekvFWWfHL8i37s';
Socket socket;

StreamController<bool> controller = StreamController<bool>();
Stream stream = controller.stream;

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
  // TODO: Put all the function handlers
  // Handler for each event:
  // socket.on('event', handler);
  print(socket);
  socket.on('connect', (_) => print('connect: '+_.toString()));
  socket.on('chat', (data) => chatReceived(data));
  socket.on('connect_error', (_) => print('errorConnect: '+_.toString()));
  socket.on('error', (_) => print('error: '+_.toString())); // Probably the problem will be with the tokens
}

void chatReceived(Map <String, dynamic> json){
  controller.add(true);
  print('Received' + json.toString());
  messages.insert(0,Message.fromJson(json));

  // TODO: Mirar como saber en que pantalla se encuentra ahora el stack, si esta en chat, habrá que hacer un setState
  /*
  setState(() {
    // instrucction
  });
  */
}

void sendMessageWebSocket(String message){
  socket.emit('chat', message);
}

void joingGame(String code){
  socket.emit('join', code);
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
