// Variables globales
UserData globalData = UserData();
UserStat globalStats = UserStat();
Error globalError = Error();

String token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTYxNzY1MDIyMiwianRpIjoiOTJlMjkyZWUtZWZkYi00MDlmLWI2ODItYzJhM2RhMDY1NDYwIiwibmJmIjoxNjE3NjUwMjIyLCJ0eXBlIjoiYWNjZXNzIiwic3ViIjoidGVzdF91c2VyMkBnbWFpbC5jb20iLCJleHAiOjE2MTc2NTExMjJ9.GX7RiY2PnJKrLA4kAZKzeEGku5Q8EB6nIqIjTRvnQ8o';

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
