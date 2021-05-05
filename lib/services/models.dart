import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:async';

//Variables globales para pasar información entre pantallas
Token globalToken = Token();
Error globalError;
Response globalMessage;
User globalUser;
UserData globalData;
UserStat globalStats;
List picsList = [];
List boardList = [];
List cardList = [];
String codeGame = '';
int numGamers = 1;

// Game data

int expansion = 0;
String currentTurnPlayer = '';
List listOfGamers = [];
List handOfPlayer = [];
List bodyOfPlayer = [];
bool isMyTurn = false;

StreamController<bool> controllerChat = StreamController<bool>.broadcast();
StreamController<bool> controllerStat = StreamController<bool>.broadcast();
StreamController<bool> controllerStartGame = StreamController<bool>.broadcast();
StreamController<bool> controllerCreateGame =
    StreamController<bool>.broadcast();
StreamController<bool> controllerUsersWaiting =
    StreamController<bool>.broadcast();
StreamController<bool> controllerGoToLogin = StreamController<bool>.broadcast();
Stream streamChat = controllerChat.stream;
Stream streamStat = controllerStat.stream;
Stream streamStartGame = controllerStartGame.stream;
Stream streamCreateGame = controllerCreateGame.stream;
Stream streamUsersWaiting = controllerUsersWaiting.stream;
Stream streamGoToLogin = controllerGoToLogin.stream;

// Partida
StreamController<bool> controlGame = StreamController<bool>.broadcast();
Stream streamGame = controlGame.stream;

//Modelos para guardar información al traducir las respuestas de la API
class Token {
  final String token;

  Token({this.token});

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(token: json['access_token']);
  }
}

class Error {
  final String error;

  Error({this.error});

  factory Error.fromJson(Map<String, dynamic> json) {
    return Error(error: json['error']);
  }
}

class Response {
  final String message;

  Response({this.message});

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(message: json['error']);
  }
}

class User {
  final String name;
  final String email;

  User({this.name, this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(name: json['name'], email: json['email']);
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

  factory UserData.fromJson(Map<String, dynamic> json) {
    print('name' + json['name']);
    return UserData(
        name: json['name'],
        email: json['email'],
        coins: json['coins'].toString(),
        picture: json['picture'],
        board: json['board']);
  }
}

class UserStat {
  final String games;
  final String losses;
  final String wins;
  final String playtimeMin;
  final String playtimeHour;

  UserStat(
      {this.games,
      this.losses,
      this.wins,
      this.playtimeMin,
      this.playtimeHour});

  factory UserStat.fromJson(Map<String, dynamic> json) {
    int aux = json['playtime_mins'];
    int mini = aux % 60;
    String min = mini.toString();
    // x ~/ y es más eficiente que (x / y).toInt()
    int houri = aux ~/ 60;
    String hour = houri.toString();
    return UserStat(
        games: json['games'].toString(),
        losses: json['losses'].toString(),
        wins: json['wins'].toString(),
        playtimeMin: min,
        playtimeHour: hour);
  }
}

//-------------------------------------------------------------------------------------------------------
// Game staff

class GamePlayer {
  String name;
  int pictureId;
  List bodyList;

  GamePlayer(String nameP, int id) {
    this.name = nameP;
    this.pictureId = id;
    this.bodyList = [];
  }
}

class CardData {
  String cardType;
  String color;
  String treatmentType;
  int id;

  CardData(String cardTypeP, String colorP, String treatmentTypeP) {
    this.cardType = cardTypeP;
    this.color = colorP;
    this.treatmentType = treatmentTypeP;
    this.id = findCard(cardTypeP, colorP, treatmentTypeP);
  }
}

// return of the id of the card
int findCard(String cardType, String color, String treatmentType) {
  // Is not a treatment card
  // TODO: Uncomment cuando backend haga lo del treatment_type
  //if(treatment_type == ''){
  // TODO: borrar cuando backend haga lo del treatment_type
  if (cardType != 'treatment') {
    for (int i = 0; i < cardList.length; i++) {
      if ((cardList[i]['type'] == cardType) &&
          (cardList[i]['color'] == color)) {
        return i;
      }
    }
    print('we have a problem' +
        cardType +
        " " +
        color +
        " " +
        treatmentType +
        " ");
    return -1;
  }
  // Is a treatment card
  // TODO: Uncomment cuando backend haga lo del treatment_type
  /*
  for(int i = 0; i < cardList.length; i++){
    if ((cardList[i]['type'] == card_type) && (cardList[i]['treatment_type'] == treatment_type)){
      return i;
    }
  }*/
  // TODO: borrar cuando backend haga lo del treatment_type
  for (int i = 0; i < cardList.length; i++) {
    if (cardList[i]['type'] == 'treatment') {
      return i;
    }
  }

  print(
      'we have a problem' + cardType + " " + color + " " + treatmentType + " ");
  return -1;
}

//-------------------------------------------------------------------------------------------------------
//Read json of pics, boards and cards
Future<bool> readPicsJson() async {
  final String response =
      await rootBundle.loadString('assets/common/profile_pics.json');
  final auxList = await json.decode(response);
  picsList = auxList;

  return true;
}

Future<bool> readBoardsJson() async {
  final String response =
      await rootBundle.loadString('assets/common/boards.json');
  final auxList = await json.decode(response);
  boardList = auxList;

  return true;
}

Future<bool> readCardsJson() async {
  final String response =
      await rootBundle.loadString('assets/common/cards.json');
  final auxList = await json.decode(response);
  cardList = auxList;

  return true;
}
