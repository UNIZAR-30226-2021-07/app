import 'package:flutter/material.dart';

class BoardStore extends StatefulWidget {
  @override
  _BoardStoreState createState() => _BoardStoreState();
}

class _BoardStoreState extends State<BoardStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Text("Pantalla tienda colores tablero"),
      ),
    );
  }
}
