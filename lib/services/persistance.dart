import 'package:shared_preferences/shared_preferences.dart';
import 'package:gatovidapp/services/profile_stadistics.dart';
import 'package:gatovidapp/services/websockets.dart';
import 'package:gatovidapp/services/models.dart';

SharedPreferences persistData;

checkIfAuthenticated() async {
  persistData = await SharedPreferences.getInstance();
  final readToken = persistData.getString('token');
  if (readToken == null){
    return false;
  }
  else{
    globalToken = Token(token: readToken);
    if (await getData() == false){
      return false;
    }
    await readPicsJson();
    await readBoardsJson();
    startWebSocket();
    return true;
  }
}

void setValuesPersistence(){
  persistData.setString('token', globalToken.token);
}

void removeValuesPersistence(){
  persistData.remove('token');
}