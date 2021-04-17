import 'package:shared_preferences/shared_preferences.dart';
import 'package:gatovidapp/services/profile_stadistics.dart';
import 'package:gatovidapp/services/websockets.dart';
import 'package:gatovidapp/services/models.dart';

SharedPreferences persistData;

checkIfAuthenticated() async {
  persistData = await SharedPreferences.getInstance();
  global_login_email = persistData.getString('email');
  if (global_login_email == null){
    return false;
  }
  else{
    global_login_password = persistData.getString('passwd');
    await readPicsJson();
    await readBoardsJson();
    await getData();
    startWebSocket();
    return true;
  }
}

void setValuesPersistence(String email, String passwd){
  persistData.setString('email', email);
  persistData.setString('passwd', passwd);
}

void removeValuesPersistence(){
  persistData.remove('email');
  persistData.remove('passwd');
}