import 'package:gatovidapp/chat/userChat.dart';
import 'package:http/http.dart' as http;
import 'package:gatovidapp/perfil/models.dart';
import 'dart:async';
import 'dart:convert';


Future<bool> getData() async{

  Map <String, String>  header = {
    "Authorization" : "Bearer $token"
  };

  var response = await http.get(Uri.parse("https://gatovid.herokuapp.com/data/user_data"), headers: header);

  print(response.body);

  var decoded = jsonDecode(response.body);

  globalData = UserData.fromJson(decoded);

  print(globalData.name);

  if (decoded['error'] != null){
    return false;
  }

  return true;
}


Future<bool> getStadistics() async{

  Map <String, String>  header = {
    "Authorization" : "Bearer $token"
  };

  String name = globalData.name;

  var response = await http.get(Uri.parse("http://gatovid.herokuapp.com/data/user_stats?name=$name"));

  var decoded = jsonDecode(response.body);

  print(response.body);

  globalStats = UserStat.fromJson(decoded);

  if (decoded['error'] != null){
    return false;
  }

  return true;
}
