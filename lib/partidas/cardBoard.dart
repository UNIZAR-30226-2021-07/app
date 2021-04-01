import 'package:flutter/material.dart';

class CardBoard extends StatefulWidget {
  @override
  _CardBoardState createState() => _CardBoardState();
}

class _CardBoardState extends State<CardBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Pantalla tablero partida"),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/rules');
                },
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFF9C4DCC),
                    onPrimary: Colors.white,
                    minimumSize: Size(double.infinity, 20 )),
                child: Text(
                  "Reglas",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize:20),
                )
            ),
            SizedBox(height: 20, width: double.infinity),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/chat');
                },
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFF9C4DCC),
                    onPrimary: Colors.white,
                    minimumSize: Size(double.infinity, 20 )),
                child: Text(
                  "Chat",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize:20),
                )
            )
          ],
        ),
      ),
    );
  }
}
