import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Color blackWords = Color(0xff000000);
Color purpleButton = Color(0xff6A1B9A);
Color whiteWords = Color(0xffffffff);

class GameCode extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;
    double screenHeight = screenSize.height;
    double screenWidth = screenSize.width;

    return new AlertDialog(
      title: Row(
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
              color: blackWords,

            ),
          ),
        ],
      ),
      content: Text('Introduce el código de partida y comienza a jugar con tus amigos.',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: screenWidth * 0.04,
          fontWeight: FontWeight.normal,
          color: blackWords,

        ),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: screenWidth * 0.25,
              height: screenHeight * 0.06,
              child: TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: screenWidth * 0.04 )),
                  hintText: 'Código',
                  isDense: true, // Added this,
                ),
              ),
            ),
            SizedBox(width: screenWidth * 0.1),
            Container(
              width: screenWidth * 0.25,
              height: screenHeight * 0.06,
                child: ElevatedButton(
                    child: Text(
                      "OK",
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: purpleButton,
                      onPrimary: whiteWords,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      shadowColor: blackWords,
                      side: BorderSide(color: whiteWords, width: 2),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }
                ),
            ),
            SizedBox(width: screenWidth * 0.07)
          ],
        ),
      ],
    );
  }
}
