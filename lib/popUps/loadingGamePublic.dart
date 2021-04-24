import 'package:flutter/material.dart';
import 'package:gatovidapp/services/websockets.dart';

Color blackWords = Color(0xff000000);

class LoadingGamePublic extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenHeight = screenSize.height;
    double screenWidth = screenSize.width;
    return WillPopScope(
        onWillPop: () async => false,
        child: new AlertDialog(
          title: Container(
            width: screenWidth * 0.8,
            child: Row(
              children: [
                Expanded(flex: 1, child: SizedBox()),
                Expanded(
                  flex: 15,
                  child: Text(
                    'Preparando partida...',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.055,
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
                      stopSearchingPublic();
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                ]),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '¿Lo sabías?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    fontWeight: FontWeight.normal,
                    color: blackWords,
                  ),
                ),
              ],
            ),
            Center(
              child: Text(
                'Uno de cada cuatro gatos es albino',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  fontWeight: FontWeight.normal,
                  color: blackWords,
                ),
              ),
            ),
          ],
        ));
  }
}
