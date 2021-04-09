import 'package:http/http.dart' as http;
import 'package:gatovidapp/services/models.dart';
import 'package:gatovidapp/services/auth.dart';
import 'dart:async';
import 'dart:convert';



Future<bool> getData() async{
  String token = globalToken.token;
  Map <String, String>  header = {
    "Authorization" : "Bearer $token"
  };

  var response = await http.get(Uri.parse("https://gatovid.herokuapp.com/data/user_data"), headers: header);

  print(response.body);

  var decoded = jsonDecode(response.body);

  if (response.statusCode == 200) {
    //Servidor devuelve estado correcto, por lo que se recibe datos de usuario
    //Transformar json datos a modelo creado
    globalData = UserData.fromJson(decoded);
    return false;
  }
  else {
    //statusCode = 401
    //Pedir token
    final AuthService _authService = AuthService();
    if (await _authService.requestToken(response)) {
    return await getData();
    }
    return false;
  }
}


Future<bool> getStadistics() async{

  String name = globalData.name;
  print(name);

  var response = await http.get(Uri.parse("http://gatovid.herokuapp.com/data/user_stats?name=$name"));

  print(response.body);

  var decoded = jsonDecode(response.body);

  if (decoded['error'] != null) {
    return await getStadistics();
  }

  globalStats = UserStat.fromJson(decoded);

  return true;
}
