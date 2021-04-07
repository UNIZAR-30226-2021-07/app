//Variables globales para pasar información entre pantallas
Token globalToken;
Error globalError;
Message globalMessage;
User globalUser;
String global_login_email;
String global_login_password;
//bool islogin = false;


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

class Message {
  final String message;

  Message({this.message});

  factory Message.fromJson(Map<String,dynamic> json) {
    return Message(message: json['error']);
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

