import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PicturesStore extends StatefulWidget {
  @override
  _PicturesStoreState createState() => _PicturesStoreState();
}

class _PicturesStoreState extends State<PicturesStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF64DD17),
        title: const Text(
          'Elegir Foto',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25.0, color: Colors.black),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Pantalla tienda avatar perfil"),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/boardStore');
                },
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFF9C4DCC),
                    onPrimary: Colors.white,
                    minimumSize: Size(double.infinity, 20)),
                child: Text(
                  "Tablero",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }
}
