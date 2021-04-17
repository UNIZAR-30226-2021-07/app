import 'package:gatovidapp/services/models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {

  Future<bool> login(String email, String password) async {
    String request = "https://gatovid.herokuapp.com/data/login";
    Map <String, String> parameters = {
      "email": "$email",
      "password": "$password",
    };

    var response = await http.post(Uri.parse(request), body: parameters);

    if (response.statusCode == 200) {
      //Servidor devuelve estado correcto, por lo que se recibe token
      //Transformar json token a modelo creado
      globalToken = Token.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      return true;
    }
    else {
      //statusCode = 400 -> Error de validación -> se recibe mensaje de error
      //Transformar json mensaje de error a modelo creado
      globalError = Error.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      return false;
    }
  }

  Future<dynamic> logout() async {
    String request = "https://gatovid.herokuapp.com/data/logout";
    String token = globalToken.token;
    Map <String, String> header = {
      "Authorization": "Bearer $token"
    };

    var response = await http.post(Uri.parse(request), headers: header);

    if (response.statusCode == 200) {
      //Servidor devuelve estado correcto, por lo que se recibe mensaje
      //Transformar json mensaje a modelo creado
      globalMessage = Response.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      return true;
    }
    else if (response.statusCode == 400) {
      //statusCode = 400 -> Error de validación -> se recibe mensaje de error
      //Transformar json mensaje de error a modelo creado
      globalError = Error.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      return false;
    }
    else {
      //statusCode = 401
      // Go to login, already is logout, token is expired
      return true;
    }
  }

  Future<bool> signup(String email, String password, String name) async {
    String request = "https://gatovid.herokuapp.com/data/signup";
    Map <String, String> parameters = {
      "email": "$email",
      "password": "$password",
      "name": "$name"
    };

    var response = await http.post(Uri.parse(request), body: parameters);

    if (response.statusCode == 200) {
      //Servidor devuelve estado correcto, por lo que se recibe user
      //Transformar json user a modelo creado
      globalUser = User.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      return true;
    }
    else {
      //statusCode = 400 -> Error de validación -> se recibe mensaje de error
      //Transformar json mensaje de error a modelo creado
      globalError = Error.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      return false;
    }
  }

  Future<dynamic> remove_user() async {
    String request = "https://gatovid.herokuapp.com/data/remove_user";
    String token = globalToken.token;
    Map <String, String> header = {
      "Authorization": "Bearer $token"
    };

    var response = await http.post(Uri.parse(request), headers: header);

    if (response.statusCode == 200) {
      //Servidor devuelve estado correcto, por lo que se recibe mensaje
      //Transformar json mensaje a modelo creado
      globalMessage = Response.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      return true;
    }
    else if (response.statusCode == 400) {
      //Error de validación -> se recibe mensaje de error
      //Transformar json mensaje de error a modelo creado
      globalError = Error.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      return false;
    }
    else {
      //statusCode = 401
      // Go to login
      return true;
    }
  }
}