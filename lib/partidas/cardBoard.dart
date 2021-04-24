import 'package:flutter/material.dart';
import 'package:gatovidapp/popUps/gamePaused.dart';
import 'package:gatovidapp/services/websockets.dart';

class CardBoard extends StatefulWidget {
  @override
  _CardBoardState createState() => _CardBoardState();
}

class _CardBoardState extends State<CardBoard> {
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: Column(
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
                      minimumSize: Size(double.infinity, 20)),
                  child: Text(
                    "Reglas",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )),
              SizedBox(height: 20, width: double.infinity),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/chat');
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xFF9C4DCC),
                      onPrimary: Colors.white,
                      minimumSize: Size(double.infinity, 20)),
                  child: Text(
                    "Chat",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )),
              ElevatedButton(
                  onPressed: () {
                    leaveGame();
                    Navigator.of(context).popUntil((route) => route.isFirst);
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xFF9C4DCC),
                      onPrimary: Colors.white,
                      minimumSize: Size(double.infinity, 20)),
                  child: Text(
                    "Salir de la partida",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )),
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) => gamePaused(),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xFF9C4DCC),
                      onPrimary: Colors.white,
                      minimumSize: Size(double.infinity, 20)),
                  child: Text(
                    "Popup gamePaused",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
