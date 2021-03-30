import 'package:flutter/material.dart';
import 'package:gatovidapp/perfil/profile.dart';

Color blackWords = Color(0xff000000);
Color redButton = Color(0xffFF0000);
Color greenButton = Color(0xff10E73F);
Color purpleButton = Color(0xff6A1B9A);
Color whiteWords = Color(0xffffffff);
Color greyWords = Color(0xff474747);

class ErrorPopup extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      title: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.warning),
            Text(' ¡Atención!',
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
      content: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis facilisis condimentum tempus. '),
      actions: <Widget>[
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              new ElevatedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_back),
                      Text(' Atrás',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.045,
                          fontWeight: FontWeight.bold,
                          color: whiteWords,
                        ),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: purpleButton,
                    onPrimary: whiteWords,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    minimumSize: Size(MediaQuery.of(context).size.width*0.36, MediaQuery.of(context).size.height * 0.075),
                    shadowColor: blackWords,
                    side: BorderSide(color: whiteWords, width: 2),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.04
                ),
              ),
              new ElevatedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(' Continuar ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.045,
                          fontWeight: FontWeight.bold,
                          color: greyWords,
                        ),
                      ),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: whiteWords,
                    onPrimary: greyWords,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    minimumSize: Size(MediaQuery.of(context).size.width*0.36, MediaQuery.of(context).size.height * 0.075),
                    shadowColor: blackWords,
                    side: BorderSide(color: greyWords, width: 2),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }
              ),
            ],
          ),
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
