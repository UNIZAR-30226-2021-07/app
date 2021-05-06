import 'package:flutter/material.dart';
import 'package:gatovidapp/tienda/money.dart';

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
          children: [
            Container(height: MediaQuery.of(context).size.height * 0.025),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width: MediaQuery.of(context).size.width * 0.075,),
                MoneyTemplate(width: MediaQuery.of(context).size.width * 0.85,height: MediaQuery.of(context).size.height * 0.1),
                Container(width: MediaQuery.of(context).size.width * 0.075,),
              ],
            ),
            Text("Pantalla tienda color tablero"),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/avatarStore');
                },
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFF9C4DCC),
                    onPrimary: Colors.white,
                    minimumSize: Size(double.infinity, 20)),
                child: Text(
                  "Avatar",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }
}
