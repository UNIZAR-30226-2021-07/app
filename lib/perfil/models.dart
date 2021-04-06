// Variables globales
UserData globalData = UserData();
UserStat globalStats = UserStat();
Error globalError = Error();

String token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTYxNzcwMTMwMSwianRpIjoiZTZkNjljZWYtNGY3My00ODI3LThlNTYtZTFjMTFmYjI1YTQ0IiwibmJmIjoxNjE3NzAxMzAxLCJ0eXBlIjoiYWNjZXNzIiwic3ViIjoidGVzdF91c2VyMUBnbWFpbC5jb20iLCJleHAiOjE2MTc3MDIyMDF9.RgF41JaFcHN_wlTZaiZxJfclh9o1vJ2XKiICYzwbMb8';

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
    int houri = aux % 60;
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
