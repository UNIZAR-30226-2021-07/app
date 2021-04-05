import 'package:gatovidapp/autentificacion/models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {


  Map<String,dynamic> json ;
  //return Token(token: json['access_token']);


  Future<bool> login(String email, String password) async {
    //http.Response res = await http.get(
    //    Uri.http("gatovid.herokuapp.com/data", "/login", { "email" : "$email" , "password" : "$password"}));

    String parameters = "email=$email&password=$password";
    print(parameters);

    //{'name': '$email', 'password': '$password'}

    //No consigo hacer de momento las peticiones con post
    //var res = await http.post(Uri.parse("http://gatovid.herokuapp.com/data/login?"), body: parameters );

    String request  = "http://gatovid.herokuapp.com/data/login?$parameters";
    print(request);

    var response = await http.get(Uri.parse(request));
    print(response.statusCode);
    print(response.body);

    //Map<String,dynamic> json ;

    if (response.statusCode == 200) {
      //Servidor devuelve estado correcto, por lo que se recibe token
      //Transformar json token a modelo creado

      //json = jsonDecode(response.body);
      //String token = json['access_token'];

      //globalToken = Token.fromJson(jsonDecode(response.body));
      //return true;
      globalError = Error.fromJson(jsonDecode(response.body));
      return false;
    }
    else {
      //Servidor devuelve estado incorrecto, por lo que se recibe mensaje de error
      //Transformar json mensaje de error a modelo creado

      //json = jsonDecode(response.body);
      //String error = json['error'];
      globalError = Error.fromJson(jsonDecode(response.body));
      return false;

    }
    //return response;
  }

  Future<dynamic> logout() async {
    //http.Response res = await http.get(
    //    Uri.http("gatovid.herokuapp.com/data", "/login", { "email" : "$email" , "password" : "$password"}));

    String token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTYxNzYzMjEwOSwianRpIjoiNDI1OTY1OTUtZTA1Ni00N2U5LWI4ZmItNzJhZjQ4YmM4YTc5IiwibmJmIjoxNjE3NjMyMTA5LCJ0eXBlIjoiYWNjZXNzIiwic3ViIjoidGVzdF91c2VyMUBnbWFpbC5jb20iLCJleHAiOjE2MTc2MzMwMDl9.aDb8FPqiN6t65K68ZO4a6Y7BGHXqpMpjbMUF5rcxIfA";
    //String token = "";

    Map <String, String>  header = {
      "Authorization" : "Bearer $token"
    };

    var response = await http.get(Uri.parse("http://gatovid.herokuapp.com/data/logout"), headers: header);
    print(response.statusCode);
    print(response.body);
    return response;
  }

}