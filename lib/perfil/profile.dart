import 'package:flutter/material.dart';
import 'package:gatovidapp/perfil/profileConf.dart';

class ProfilePage extends StatefulWidget {
  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  final FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightGreenAccent,
        title: const Text(
          'Mi perfil',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 30.0,
              color: Colors.black),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: new Container(
        color: Colors.white,
        child: Stack(
          children: <Widget>[

          ],
        )
      ),
    );
  }
}
