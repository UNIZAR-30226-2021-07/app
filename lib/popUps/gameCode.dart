import 'package:flutter/material.dart';
import 'package:gatovidapp/popUps/loadingGame.dart';
import 'package:gatovidapp/services/websockets.dart';
import 'package:gatovidapp/services/models.dart';

class GameCode extends StatelessWidget {

  final TextEditingController _code = TextEditingController();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;
    double screenHeight = screenSize.height;
    double screenWidth = screenSize.width;

    return WillPopScope(
        child: AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(width: screenWidth * 0.04),
              Icon(
                Icons.done_outline,
                color: Color(0xFF64DD17),
                size: screenWidth * 0.08,
              ),
              SizedBox(width: screenWidth * 0.02),
              Text('Unirse a partida',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenWidth * 0.06,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          content: Text('Introduce el código de partida y comienza a jugar con tus amigos.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: screenWidth * 0.04,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          ),
          actions: <Widget>[
            SizedBox(
              width: screenWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                      child: SizedBox()
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      height: screenHeight * 0.06,
                      child: TextFormField(
                        controller: _code,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(width: screenWidth * 0.04 )),
                          hintText: 'Código',
                          isDense: true, // Added this,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: SizedBox()
                  ),
                  Expanded(
                    flex: 3,
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
                              Navigator.of(context).pop();
                              if (_code.text != ''){
                                codeGame = _code.text;
                                joingGame(_code.text); // TODO: Que pasa si hay un error, ni idea
                                showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (BuildContext context) => LoadingGame(),
                                );
                              }
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
