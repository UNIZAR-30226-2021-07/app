import 'package:gatovidapp/services/models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {

  Future<bool> login(String email, String password) async {
    String parameters = "email=$email&password=$password";
    String request = "http://gatovid.herokuapp.com/data/login?$parameters";

    var response = await http.get(Uri.parse(request));
    print(utf8.decode(response.bodyBytes));

    if (response.statusCode == 200) {
      //Servidor devuelve estado correcto, por lo que se recibe token
      //Transformar json token a modelo creado
      globalToken = Token.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      return true;
    }
    else {
      //Servidor devuelve estado incorrecto, por lo que se recibe mensaje de error
      //Transformar json mensaje de error a modelo creado
      globalError = Error.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      return false;
    }
  }

  Future<dynamic> logout() async {
    String request = "http://gatovid.herokuapp.com/data/logout";
    String token = globalToken.token;
    Map <String, String> header = {
      "Authorization": "Bearer $token"
    };

    var response = await http.get(Uri.parse(request), headers: header);
    //print(response.statusCode);
    //print(utf8.decode(response.bodyBytes));

    if (response.statusCode == 200) {
      //Servidor devuelve estado correcto, por lo que se recibe mensaje
      //Transformar json mensaje a modelo creado
      globalMessage =
          Message.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      return true;
    }
    else if (response.statusCode == 400) {
      //Servidor devuelve estado incorrecto, por lo que se recibe mensaje de error
      //Transformar json mensaje de error a modelo creado
      globalError = Error.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      return false;
    }
    else {
      //Servidor devuelve estado incorrecto por token de sesión expirado
      //Volver a pedir token
      final AuthService _authService = AuthService();
      if (await _authService.login(global_login_email, global_login_password)) {
        return _authService.logout();
      }
    }
  }


  Future<bool> signup(String email, String password, String name) async {
    String parameters = "email=$email&password=$password&name=$name";
    String request = "http://gatovid.herokuapp.com/data/signup?$parameters";

    var response = await http.get(Uri.parse(request));

    if (response.statusCode == 200) {
      //Servidor devuelve estado correcto, por lo que se recibe user
      //Transformar json user a modelo creado
      globalUser = User.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      return true;
    }
    else {
      //Servidor devuelve estado incorrecto, por lo que se recibe mensaje de error
      //Transformar json mensaje de error a modelo creado
      globalError = Error.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      return false;
    }
  }

  Future<dynamic> remove_account() async {
    String request = "http://gatovid.herokuapp.com/data/remove_acount";
    String token = globalToken.token;
    Map <String, String> header = {
      "Authorization": "Bearer $token"
    };

    var response = await http.get(Uri.parse(request), headers: header);
    print(response.statusCode);
    print(utf8.decode(response.bodyBytes));

    if (response.statusCode == 200) {
      //Servidor devuelve estado correcto, por lo que se recibe mensaje
      //Transformar json mensaje a modelo creado
      globalMessage = Message.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      return true;
    }
    else if (response.statusCode == 400) {
      //Servidor devuelve estado incorrecto, por lo que se recibe mensaje de error
      //Transformar json mensaje de error a modelo creado
      globalError = Error.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      return false;
    }
    else {
      //Servidor devuelve estado incorrecto por token de sesión expirado
      //Volver a pedir token
      final AuthService _authService = AuthService();
      if (await _authService.login(global_login_email, global_login_password)) {
        return _authService.logout();
      }
    }
  }
}