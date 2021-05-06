import 'package:flutter/material.dart';
import 'package:gatovidapp/services/auth.dart';
import 'package:gatovidapp/services/models.dart';

Color blackWords = Color(0xff000000);
Color redButton = Color(0xffFF0000);
Color greyButton = Color(0xffE5E5E5);
Color whiteWords = Color(0xffffffff);

class PurchaseAlert extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      title: Text(
        '¿Quiere comprar el artículo?',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.width * 0.06,
          fontWeight: FontWeight.bold,
          color: blackWords,
        ),
      ),
      actions: <Widget>[
        new Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                costPurchaseSelected,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.06,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff000000),
                ),
              ),
              Container(width: MediaQuery.of(context).size.width * 0.03,),
              Icon(Icons.pets,
                  size: MediaQuery.of(context).size.width * 0.1, color: Colors.amber),
            ],
          ),
        ),
        Padding(
          padding:
          EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.023),
        ),
        new Center(
          child: new ElevatedButton(
              child: const Text(
                "Si",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color(0xff10E73F),
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
                Navigator.of(context).pop();
              }),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.023),
        ),
        new Center(
          child: new ElevatedButton(
              child: const Text(
                "No",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color(0xffff0000),
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
                Navigator.of(context).pop();
              }),
        )
      ],
    );
  }
}
