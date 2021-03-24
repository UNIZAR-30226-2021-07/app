import 'package:flutter/material.dart';

class GamesMenu extends StatefulWidget {
  @override
  _GamesMenuState createState() => _GamesMenuState();
}

class _GamesMenuState extends State<GamesMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: <Widget>[
          SizedBox(height: 20.0),
          Row(
            children: <Widget>[
              SizedBox(width: 20.0),
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/defaultProfile.png'),
                radius: 30.0,
              ),
              SizedBox(width: 250.0),
              Icon(Icons.storefront, size: 70.0)
            ],
          ),
          SizedBox(height: 5.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '150',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              SizedBox(width: 20.0),
              Icon(Icons.pets, size: 20.0, color: Colors.amber),
              SizedBox(width: 20.0),
            ],
          ),
          SizedBox(height: 5.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  child: Image.asset(
                'assets/images/logo.png',
                height: 200.0,
                width: 200.0,
              )
                  //child: Icon(Icons.android_rounded,
                  //size: 130.0,)
                  ),
              SizedBox(height: 10.0),
              Text('GATOVID',
                  style: TextStyle(
                    fontFamily: 'ShortStack',
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ))
            ],
          ),
          SizedBox(height: 40.0),
          Padding(
              padding: EdgeInsets.only(left: 25.0, right: 25.0),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: Colors.purple[800],
                      onPrimary: Colors.white,
                      minimumSize: Size(300.0, 50.0)),
                  child: Text(
                    "Crear Partida Privada",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ))),
          SizedBox(height: 30.0),
          Padding(
              padding: EdgeInsets.only(left: 25.0, right: 25.0),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: Colors.purple[800],
                      onPrimary: Colors.white,
                      minimumSize: Size(300.0, 50.0)),
                  child: Text(
                    "Unirse a partida privada",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ))),
          SizedBox(height: 30.0),
          Padding(
              padding: EdgeInsets.only(left: 25.0, right: 25.0),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: Colors.purple[800],
                      onPrimary: Colors.white,
                      minimumSize: Size(300.0, 50.0)),
                  child: Text(
                    "Unirse a partida pública",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ))),
        ],
      ),
    ));
  }
}
