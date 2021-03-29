import 'package:flutter/material.dart';

Color blackWords = Color(0xff000000);
Color purpleButton = Color(0xff6A1B9A);
Color whiteWords = Color(0xffffffff);

class StartGame extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      title: Text('¿Empezar partida?',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.width * 0.06,
          fontWeight: FontWeight.bold,
          color: blackWords,

        ),
      ),
      content: Text('Esperando a tus amigos gaticos para jugar. Tú decides cuándo empezar. ',
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
              "Empezar Partida",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              primary: purpleButton,
              onPrimary: whiteWords,
              minimumSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height * 0.075),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ],
    );
  }
}