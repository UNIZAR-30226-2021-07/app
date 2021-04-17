import 'package:flutter/material.dart';
import 'package:gatovidapp/popUps/startGame.dart';
import 'package:gatovidapp/services/models.dart';
import 'package:gatovidapp/services/websockets.dart';
import 'package:clipboard/clipboard.dart';

class ReadyGame extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;
    double screenHeight = screenSize.height;
    double screenWidth = screenSize.width;

    return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.done_outline,
                  color: Color(0xFF64DD17),
                  size: screenWidth * 0.08,
                ),
                SizedBox(width: screenWidth * 0.02),
                Text('Partida privada lista',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FlatButton(
                      child: Text('X',style: TextStyle(fontSize: screenWidth * 0.055)),
                      height: screenHeight*0.025,
                      minWidth: screenWidth*0.015,
                      textColor: Colors.grey,
                      onPressed: () {
                        leaveGame();
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: screenHeight *0.015),
            Text('Comparte el siguiente código con tus amigos para empezar a jugar:',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenWidth * 0.04,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
            SizedBox(height: screenHeight *0.025),
            SizedBox(
              width: screenWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                      child: SizedBox()
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                        child: ElevatedButton(
                            child: Icon(
                              Icons.content_paste,
                              color: Colors.white,
                              size: screenWidth * 0.08,
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xff6A1B9A),
                              onPrimary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              shadowColor: Colors.black,
                              side: BorderSide(color: Colors.white, width: 2),
                            ),
                            onPressed: () {
                              FlutterClipboard.copy(codeGame).then(( value ) => print('copied')); // Copy to the clipboard
                            }
                        ),
                    ),
                  ),
                  Expanded(
                      child: SizedBox()
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      width: screenWidth * 0.25,
                      height: screenHeight * 0.06,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey,
                        ),
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(codeGame,
                            style: TextStyle(fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold)
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: SizedBox()
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                        child: ElevatedButton(
                            child: Text(
                              "OK",
                              style: TextStyle(fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xff6A1B9A),
                              onPrimary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              shadowColor: Colors.black,
                              side: BorderSide(color: Colors.white, width: 2),
                            ),
                            onPressed: () {
                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (BuildContext context) => StartGame(),
                              );
                            }
                        ),
                    ),
                  ),
                  Expanded(
                      child: SizedBox()
                  ),
                ],
              ),
            ),
          ],
        )
    );
  }
}
/*
How to use in a button:

onPressed: () {
  showDialog(
    context: context,
    builder: (BuildContext context) => GenericPopUp(),
  );
}

*/
