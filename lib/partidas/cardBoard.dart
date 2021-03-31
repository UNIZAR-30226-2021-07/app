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
        child:Text("Pantalla tablero"),
      ),
    );
  }
}
