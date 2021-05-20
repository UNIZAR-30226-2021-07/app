import 'package:flutter/material.dart';
import 'package:gatovidapp/popUps/loadingGameWithNumberGamers.dart';
import 'package:gatovidapp/services/websockets.dart';

class ExitPublic extends StatelessWidget {
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
                  Container(
                    height: screenHeight * 0.02,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CloseButton(
                            onPressed: () {
                              Navigator.pop(context);
                            }
                        )
                      ],
                    ),
                  ),
                 Text(
                      '¿Quieres salir?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: screenWidth * 0.055,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
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
          ],
        ));
  }
}
