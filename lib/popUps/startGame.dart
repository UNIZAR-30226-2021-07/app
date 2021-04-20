import 'package:flutter/material.dart';
import 'package:gatovidapp/services/websockets.dart';
import 'package:gatovidapp/services/models.dart';
import 'package:gatovidapp/popUps/loadingGame.dart';
import 'dart:async';

Color blackWords = Color(0xff000000);
Color purpleButton = Color(0xff6A1B9A);
Color whiteWords = Color(0xffffffff);

class StartGame extends StatefulWidget {
  @override
  _StartGame createState() => _StartGame();
}

class _StartGame extends State<StartGame> {
  // This widget is the root of your application.

  StreamSubscription<bool> streamSubscription;

  @override
  void initState() {
    super.initState();
    streamSubscription = streamUsersWaiting.listen((data) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenHeight = screenSize.height;
    double screenWidth = screenSize.width;
    return AlertDialog(
      actions: <Widget>[
        Container(
          height: screenHeight*0.1,
          width: screenWidth*0.8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  flex: 1,
                  child: SizedBox()),
              Expanded(
                flex: 6,
                child: Text(
                  '¿Empezar partida?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.06,
                    fontWeight: FontWeight.bold,
                    color: blackWords,
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: TextButton(
                    child: Text('X',
                        style: TextStyle(fontSize: screenWidth * 0.055)),
                    style: TextButton.styleFrom(
                      primary: Colors.grey,
                      minimumSize:
                      Size(screenHeight * 0.025, screenWidth * 0.015),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),),
            ],
          ),
        ),
        SizedBox(height: screenHeight * 0.01),
        Center(
          child: Text(
            numGamers.toString() + '/6 gaticos preparados',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.04,
              fontWeight: FontWeight.normal,
              color: blackWords,
            ),
          ),
        ),
        SizedBox(height: screenHeight * 0.02),
        new ElevatedButton(
            child: const Text(
              "Empezar Partida",
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
              startGame();
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (BuildContext context) => LoadingGame(),
              );
            }),
        SizedBox(height: screenHeight * 0.01),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    streamSubscription.cancel();
  }
}
