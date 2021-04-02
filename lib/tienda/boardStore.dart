import 'package:flutter/material.dart';

class BoardStore extends StatefulWidget {
  @override
  _BoardStoreState createState() => _BoardStoreState();
}

class _BoardStoreState extends State<BoardStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF64DD17),
        title: const Text(
          'Elegir Tablero',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
              color: Colors.black),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded),
            color:  Colors.black,
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: SafeArea(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Pantalla tienda color tablero"),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/avatarStore');
                },
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFF9C4DCC),
                    onPrimary: Colors.white,
                    minimumSize: Size(double.infinity, 20 )),
                child: Text(
                  "Avatar",
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
