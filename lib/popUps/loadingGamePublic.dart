import 'package:flutter/material.dart';
import 'package:gatovidapp/services/websockets.dart';

Color blackWords = Color(0xff000000);

class LoadingGamePublic extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenHeight = screenSize.height;
    return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          actions: [
            Container(
              height: screenHeight * 0.03,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CloseButton(onPressed: () {
                    stopSearchingPublic();
                    Navigator.pop(context);
                  })
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Center(
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
            SizedBox(height: screenHeight * 0.02),
            Center(
              child: CircularProgressIndicator(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Center(
              child: Text(
                '¿Lo sabías?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  fontWeight: FontWeight.normal,
                  color: blackWords,
                ),
              ),
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
