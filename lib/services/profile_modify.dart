import 'package:http/http.dart' as http;
import 'package:gatovidapp/services/models.dart';
import 'dart:async';
import 'dart:convert';

Future<bool> modifyData(String typeMod, String valueMod) async {
  String token = globalToken.token;
  Map<String, String> header = {"Authorization": "Bearer $token"};

  String request = "https://gatovid.herokuapp.com/data/modify_user";
  Map<String, String> parameters = {"$typeMod": "$valueMod"};

  print(parameters);

  var response =
      await http.post(Uri.parse(request), body: parameters, headers: header);

  print(response.body);

  if (response.statusCode == 200) {
    //Servidor devuelve estado correcto, por lo que se recibe datos de usuario
    //Transformar json datos a modelo creado
    return true;
  } else if (response.statusCode == 400) {
    //statusCode = 400 -> Error de validación -> se recibe mensaje
    //Transformar json mensaje de error a modelo creado
    globalError = Error.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    return false;
  } else {
    //statusCode = 401
    controllerGoToLogin.add(true);
    return false;
  }
}

Future<bool> buyItem(String typeMod, String idValue) async {
  String token = globalToken.token;
  Map<String, String> header = {"Authorization": "Bearer $token"};

  String request = "https://gatovid.herokuapp.com/data/shop_buy";
  Map<String, String> parameters = {"type": "$typeMod", "id": "$idValue"};

  print(parameters);

  var response =
      await http.post(Uri.parse(request), body: parameters, headers: header);

  print(response.body);

  if (response.statusCode == 200) {
    //Servidor devuelve estado correcto, por lo que se recibe datos de usuario
    //Transformar json datos a modelo creado
    return true;
  } else if (response.statusCode == 400) {
    //statusCode = 400 -> Error de validación -> se recibe mensaje
    //Transformar json mensaje de error a modelo creado
    globalError = Error.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    return false;
  } else {
    //statusCode = 401
    controllerGoToLogin.add(true);
    return false;
  }
}
