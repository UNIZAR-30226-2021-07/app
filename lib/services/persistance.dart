import 'package:shared_preferences/shared_preferences.dart';
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
    return true;
  }
}