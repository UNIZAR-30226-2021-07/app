// Variables globales
UserData globalData = UserData();
UserStat globalStats = UserStat();
Error globalError = Error();

String token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTYxNzczMjEzMCwianRpIjoiOTcxMTkwMTEtOWJiMy00Yjk5LTkxZDEtOTA3NjA2NDQ5MDhiIiwibmJmIjoxNjE3NzMyMTMwLCJ0eXBlIjoiYWNjZXNzIiwic3ViIjoidGVzdF91c2VyMUBnbWFpbC5jb20iLCJleHAiOjE2MTc3MzMwMzB9.PcBJ8th7-loavNJKm5VuYOkRRxDhNsLYVvze_MpdNnY';
class UserData {
  String name;
  String email;

  UserData({this.name, this.email});

  factory UserData.fromJson(Map<String,dynamic> json) {
    return UserData(name: json['name'], email: json['email']);
  }
}

class UserStat {
  String games;
  String losses;
  String wins;
  String playtimeMin;
  String playtimeHour;

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

class Error {
  final String error;

  Error({this.error});

  factory Error.fromJson(Map<String,dynamic> json) {
    return Error(error: json['error']);
  }
}
