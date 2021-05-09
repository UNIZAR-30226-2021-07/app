import 'package:flutter/material.dart';
import 'package:gatovidapp/services/models.dart';

Color blackWords = Color(0xff000000);

class GamePausedOthers extends StatelessWidget {
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
                Icon(
                  Icons.pause_circle_outline_rounded,
                  size: MediaQuery.of(context).size.width * 0.1,
                ),
                Text(
                  'Partida Pausada',
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
            'El gatico ' + playerWhoPaused + ' ha parado la partida.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.04,
              fontWeight: FontWeight.normal,
              color: blackWords,
            ),
          )
        ));
  }
}
