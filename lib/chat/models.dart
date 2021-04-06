import 'package:socket_io_client/socket_io_client.dart';

String token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTYxNzcxODI4OSwianRpIjoiNjQ1Yzg5NTItZDJlNy00ZjBkLThlZmMtNDU0ZGY1NjdiYWIyIiwibmJmIjoxNjE3NzE4Mjg5LCJ0eXBlIjoiYWNjZXNzIiwic3ViIjoidGVzdF91c2VyMkBnbWFpbC5jb20iLCJleHAiOjE2MTc3MTkxODl9.x8PxpUgksoR1gnDltYUL2YdpA2E6UrI18KVLeT4cZuU';

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
  socket.on('connect', (_) => print('connect: '+_.toString()));
  socket.on('chat', (data) => chatReceived(data));
  socket.on('connect_error', (_) => print('errorConnect: '+_.toString()));
  socket.on('error', (_) => print('error: '+_.toString())); // Probably the problem will be with the tokens
}

void chatReceived(Map <String, String> json){
  messages.insert(0,Message.fromJson(json));

  // TODO: Mirar como saber en que pantalla se encuentra ahora el stack, si esta en chat, habrá que hacer un setState
  /*
  setState(() {
    // instrucction
  });
  */
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
