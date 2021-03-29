import 'package:flutter/material.dart';

Color blackWords = Color(0xff000000);

class LoadingGame extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      title: Text('Preparando partida...',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.width * 0.06,
          fontWeight: FontWeight.bold,
          color: blackWords,
        ),
      ),
      actions: [
        Center(
          child: Image.asset('assets/gifs/arrowloading.gif'),
        ),
        Center(
          child: Text('¿Lo sabías?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.05,
              fontWeight: FontWeight.normal,
              color: blackWords,
            ),
          ),
        ),
        Center(
          child: Text('Uno de cada cuatro gatos es albino',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.05,
              fontWeight: FontWeight.normal,
              color: blackWords,
            ),
          ),
        ),
      ],
    );
  }
}
