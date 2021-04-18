import 'package:shared_preferences/shared_preferences.dart';
import 'package:gatovidapp/services/profile_stadistics.dart';
import 'package:gatovidapp/services/websockets.dart';
import 'package:gatovidapp/services/models.dart';

SharedPreferences persistData;

checkIfAuthenticated() async {
  persistData = await SharedPreferences.getInstance();
  final readToken = persistData.getString('token');
  if (readToken == null) {
    print('readToken == null');
    return false;
  } else {
    print('readToken != null');
    globalToken = Token(token: readToken);
    if (await getData()) {
      await readPicsJson();
      await readBoardsJson();
      startWebSocket();
      return true;
    }
    return false;
  }
}

void setValuesPersistence() {
  persistData.setString('token', globalToken.token);
}

void removeValuesPersistence() {
  disconnectWebSocket();
  persistData.remove('token');
}
