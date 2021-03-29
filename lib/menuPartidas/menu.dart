import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gatovidapp/perfil/profile.dart';
import 'package:gatovidapp/popUps/genericPopup.dart';

class GamesMenu extends StatefulWidget {
  @override
  _GamesMenuState createState() => _GamesMenuState();
}

class _GamesMenuState extends State<GamesMenu> {
  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;
    double screenHeight = screenSize.height;
    double screenWidth = screenSize.width;

    return Scaffold(
        body: SafeArea(
      child: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.05), BlendMode.dstATop),
              image: AssetImage("assets/images/bg.png"),
              fit: BoxFit.cover,
            )
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                SizedBox(width: screenWidth * 0.01),
                Container(
                  color: Colors.red,
                  margin: EdgeInsets.only(top: screenHeight * 0.02),
                  padding: EdgeInsets.fromLTRB(screenWidth * 0.005, screenHeight * 0.01, screenWidth * 0.005, screenHeight * 0.01),
                  child: FlatButton(
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/defaultProfile.png'),
                        radius: 30.0,
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                      },
                    ),
                ),
                //SizedBox(width: screenSize.width * 0.58),
                Container(
                  alignment: Alignment.topRight,
                    margin: EdgeInsets.only(left: screenWidth * 0.58),
                    padding: EdgeInsets.fromLTRB(screenWidth * 0.005, screenHeight * 0.01, screenWidth * 0.005, screenHeight * 0.01),
                    color: Colors.blue,
                    child: Icon(Icons.storefront, size: 60.0))
              ],
            ),
            //SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                    '150',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenHeight * 0.03),
                  ),
                SizedBox(width: screenWidth * 0.02),
                Icon(Icons.pets, size: 20.0, color: Colors.amber),
                SizedBox(width: screenWidth * 0.04),
              ],
            ),
            SizedBox(height: screenHeight * 0.005),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                    height: screenHeight * 0.3,
                    width: screenWidth * 0.5,
                ),
                    //child: Icon(Icons.android_rounded,
                    //size: 130.0,)
                SizedBox(height: screenHeight * 0.02),
                Text('GATOVID',
                    style: TextStyle(
                      fontFamily: 'ShortStack',
                      fontWeight: FontWeight.bold,
                      fontSize: screenHeight * 0.05,
                    )),
              ],
            ),
            SizedBox(height: screenHeight * 0.05),
            ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: Colors.purple[800],
                        onPrimary: Colors.white,
                        minimumSize: Size(screenWidth * 0.75, screenHeight * 0.08)),
                    child: Text(
                      "Crear Partida Privada",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                    )),
            SizedBox(height: screenHeight * 0.03),
            ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => GenericPopUp(),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.purple[800],
                        onPrimary: Colors.white,
                        minimumSize: Size(screenWidth * 0.75, screenHeight * 0.08)),
                    child: Text(
                      "Unirse a partida privada",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                    )),
            SizedBox(height: screenHeight * 0.03),
            ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: Colors.purple[800],
                        onPrimary: Colors.white,
                        minimumSize: Size(screenWidth * 0.75, screenHeight * 0.08)),
                    child: Text(
                      "Unirse a partida pública",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                    )),
          ],
        ),
      ),
    ));
  }
}
