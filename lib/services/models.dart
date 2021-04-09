import 'package:socket_io_client/socket_io_client.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:async';

//Variables globales para pasar información entre pantallas
Token globalToken;
Error globalError;
Response globalMessage;
User globalUser;
UserData globalData;
UserStat globalStats;
String global_login_email = "";
String global_login_password = "";
List picsList = [];
List boardList = [];

Socket socket;

StreamController<bool> controllerChat = StreamController<bool>.broadcast();
StreamController<bool> controllerStat = StreamController<bool>.broadcast();
Stream streamChat = controllerChat.stream;
Stream streamStat = controllerStat.stream;


//Modelos para guardar información al traducir las respuestas de la API
class Token {
  final String token;

  Token({this.token});

  factory Token.fromJson(Map<String,dynamic> json) {
    return Token(token: json['access_token']);
  }
}

class Error {
  final String error;

  Error({this.error});

  factory Error.fromJson(Map<String,dynamic> json) {
    return Error(error: json['error']);
  }
}

class Response {
  final String message;

  Response({this.message});

  factory Response.fromJson(Map<String,dynamic> json) {
    return Response(message: json['error']);
  }
}

class User {
  final String name;
  final String email;

  User({this.name, this.email});

  factory User.fromJson(Map<String,dynamic> json) {
    return User(
        name: json['name'],
        email: json['email']
    );
  }
}

class UserData {
  final String name;
  final String email;
  final String coins;
  final int picture;
  final int board;
  //TODO: Transformar datos de la lista
  //List

  UserData({this.name, this.email, this.coins, this.picture, this.board});

  factory UserData.fromJson(Map<String,dynamic> json) {
    print('name' + json['name']);
    return UserData(name: json['name'], email: json['email'], coins: json['coins'].toString(), picture: json['picture'], board: json['board']);
  }
}

class UserStat {
  final String games;
  final String losses;
  final String wins;
  final String playtimeMin;
  final String playtimeHour;

  UserStat({this.games, this.losses, this.wins, this.playtimeMin, this.playtimeHour});

  factory UserStat.fromJson(Map<String,dynamic> json) {
    int aux = json['playtime_mins'];
    int mini = aux % 60;
    String min = mini.toString();
    int houri = (aux / 60).toInt();
    String hour = houri.toString();
    return UserStat(games: json['games'].toString(), losses: json['losses'].toString(), wins: json['wins'].toString(), playtimeMin: min, playtimeHour: hour);
  }
}

//-------------------------------------------------------------------------------------------------------
//Read json of pics, boards and cards
Future<bool> readPicsJson() async{
  final String response = await rootBundle.loadString('assets/common/profile_pics.json');
  final auxList= await json.decode(response);
  picsList = auxList;
}

Future<bool> readBoardsJson() async{
  final String response = await rootBundle.loadString('assets/common/boards.json');
  final auxList = await json.decode(response);
  boardList = auxList;
}

//-------------------------------------------------------------------------------------------------------
//Chat

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
  controllerChat.add(true);
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

