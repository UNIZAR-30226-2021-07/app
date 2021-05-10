import 'package:flutter/material.dart';
import 'package:gatovidapp/popUps/loadingGameWithNumberGamers.dart';
import 'package:gatovidapp/services/websockets.dart';
import 'package:flutter_restart/flutter_restart.dart';

class ExitPrivate extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenHeight = screenSize.height;
    double screenWidth = screenSize.width;

    return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          actions: <Widget>[
            SizedBox(height: screenHeight * 0.01),
            Container(
              width: screenWidth * 0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 8,
                    child: Text(
                    '¿Quieres salir?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: screenWidth * 0.055,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),),
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          child: Text('X',
                              style: TextStyle(fontSize: screenWidth * 0.055)),
                          style: TextButton.styleFrom(
                            primary: Colors.grey,
                            minimumSize:
                            Size(screenHeight * 0.025, screenWidth * 0.025),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.015),
            ElevatedButton(
                child: const Text(
                  "Abandonar Partida",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffFF0000),
                  onPrimary: Colors.white,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  minimumSize: Size(MediaQuery.of(context).size.width,
                      MediaQuery.of(context).size.height * 0.075),
                  shadowColor: blackWords,
                  side: BorderSide(color: Colors.white, width: 2),
                ),
                onPressed: () {
                  leaveGame();
                  Navigator.of(context).popUntil((route) => route.isFirst);
                  Navigator.pushReplacementNamed(context, '/home');
                }),
            SizedBox(height: screenHeight * 0.025),
            ElevatedButton(
                child: const Text(
                  "Salir y reanudar más tarde",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff6A1B9A),
                  onPrimary: Colors.white,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  minimumSize: Size(MediaQuery.of(context).size.width,
                      MediaQuery.of(context).size.height * 0.075),
                  shadowColor: blackWords,
                  side: BorderSide(color: Colors.white, width: 2),
                ),
                onPressed: () {
                  FlutterRestart.restartApp();
                }),
            SizedBox(height: screenHeight * 0.025),
          ],
        ));
  }
}
