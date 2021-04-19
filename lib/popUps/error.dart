import 'package:flutter/material.dart';
import 'package:gatovidapp/services/models.dart';

Color blackWords = Color(0xff000000);
Color redButton = Color(0xffFF0000);
Color greenButton = Color(0xff10E73F);
Color purpleButton = Color(0xff6A1B9A);
Color whiteWords = Color(0xffffffff);
Color greyWords = Color(0xff474747);

class ErrorPopup extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          title: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.warning),
                Text(
                  '¡Atención!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.06,
                    fontWeight: FontWeight.bold,
                    color: blackWords,
                  ),
                ),
              ],
            ),
          ),
          content: Text(
            globalError.error,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.04,
              fontWeight: FontWeight.normal,
              color: blackWords,
            ),
          ),
          actions: <Widget>[
            new ElevatedButton(
                child: const Text(
                  "Aceptar",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  primary: purpleButton,
                  onPrimary: whiteWords,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  minimumSize: Size(MediaQuery.of(context).size.width,
                      MediaQuery.of(context).size.height * 0.075),
                  shadowColor: blackWords,
                  side: BorderSide(color: whiteWords, width: 2),
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ],
        ));
  }
}
