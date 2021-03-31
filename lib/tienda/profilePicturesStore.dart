import 'package:flutter/material.dart';

class PicturesStore extends StatefulWidget {
  @override
  _PicturesStoreState createState() => _PicturesStoreState();
}

class _PicturesStoreState extends State<PicturesStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Text("Pantalla tienda colores tablero"),
      ),
    );
  }
}
