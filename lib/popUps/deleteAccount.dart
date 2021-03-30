import 'package:flutter/material.dart';

Color blackWords = Color(0xff000000);
Color redButton = Color(0xffFF0000);
Color greenButton = Color(0xff10E73F);
Color whiteWords = Color(0xffffffff);

class DeleteAccount extends StatelessWidget {
  // This widget is the root of your application.
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
                primary: greenButton,
                onPrimary: whiteWords,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                minimumSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height * 0.075),
                shadowColor: blackWords,
                side: BorderSide(color: whiteWords, width: 2),
              ),
              onPressed: () {
                //TODO: Delete account
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
                primary: redButton,
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
