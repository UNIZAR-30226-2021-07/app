import 'package:flutter/material.dart';

Color blackWords = Color(0xff000000);
Color purpleButton = Color(0xff6A1B9A);
Color whiteWords = Color(0xffffffff);

class ReadyGame extends StatelessWidget {
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
          Text('Partida privada lista',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: screenWidth * 0.05,
              fontWeight: FontWeight.bold,
              color: blackWords,

            ),
          ),
        ],
      ),
      content: Text('Comparte el siguiente código con tus amigos para empezar a jugar:',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: screenWidth * 0.04,
          fontWeight: FontWeight.normal,
          color: blackWords,
        ),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: screenWidth * 0.18,
              height: screenHeight * 0.06,
                child: ElevatedButton(
                    child: Icon(
                      Icons.content_paste,
                      color: Colors.white,
                      size: screenWidth * 0.08,
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
            SizedBox(width: screenWidth * 0.03),
            Container(
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
                  Text('4567',
                    style: TextStyle(fontSize: screenWidth * 0.06, fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            ),
            SizedBox(width: screenWidth * 0.03),
            Container(
              width: screenWidth * 0.18,
              height: screenHeight * 0.06,
                child: ElevatedButton(
                    child: Text(
                      "OK",
                      style: TextStyle(fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
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
          ],
        ),
      ],
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
