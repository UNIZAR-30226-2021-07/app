import 'package:flutter/material.dart';
import 'package:gatovidapp/popUps/error.dart';
import 'package:gatovidapp/services/auth.dart';
import 'package:gatovidapp/services/models.dart';

Color blackWords = Color(0xff000000);
Color redButton = Color(0xffFF0000);
Color greyButton = Color(0xffE5E5E5);
Color whiteWords = Color(0xffffffff);

class DeleteAccount extends StatelessWidget {

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      title: Text('¿Eliminar su cuenta permanentemente?',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.width * 0.06,
          fontWeight: FontWeight.bold,
          color: blackWords,

        ),
      ),
      actions: <Widget>[
        new Center(
          child: new ElevatedButton(
              child: const Text(
                "Si",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                primary: redButton,
                onPrimary: whiteWords,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                minimumSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height * 0.075),
                shadowColor: blackWords,
                side: BorderSide(color: whiteWords, width: 2),
              ),
              onPressed: () async {
                Navigator.of(context).pop();
                //Comprobación cierre de sesión
                if (await _authService.remove_account()){
                  print(globalMessage);
                  Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
                }
                else {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) => ErrorPopup(),
                  );
                }
              }
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.023
          ),
        ),
        new Center(
          child: new ElevatedButton(
              child: const Text(
                "No",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                primary: greyButton,
                onPrimary: whiteWords,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                minimumSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height * 0.075),
                shadowColor: blackWords,
                side: BorderSide(color: whiteWords, width: 2),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              }
          ),
        )
      ],
    );
  }
}
