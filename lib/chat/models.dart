import 'package:socket_io_client/socket_io_client.dart';

String token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTYxNzcyMjgzMSwianRpIjoiNDE4ODA0ZTUtMzM5Yi00NDkwLWI4Y2YtYTVhYTQyOTg3N2NjIiwibmJmIjoxNjE3NzIyODMxLCJ0eXBlIjoiYWNjZXNzIiwic3ViIjoidGVzdF91c2VyMUBnbWFpbC5jb20iLCJleHAiOjE2MTc3MjM3MzF9.H3_zftfT8eGRBhYV1j1EJrSgpJsH60H_3eTwDr8tWwM';
Socket socket;

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
  socket.emit('chat', "messageToSend.text");
}

void chatReceived(Map <String, String> json){
  print(json);
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
