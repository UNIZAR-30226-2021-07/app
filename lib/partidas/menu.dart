import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gatovidapp/popUps/gameCode.dart';
import 'package:gatovidapp/popUps/loadingGame.dart';
import 'package:gatovidapp/popUps/readyGame.dart';

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
                Expanded(
                  flex: 2,
                    child: Column (
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              Expanded(
                                child: CircleAvatar(
                                  backgroundImage: AssetImage('assets/images/defaultProfile.png'),
                                  radius: screenHeight * 0.04,
                                  child: TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, '/profile');
                                      }
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: SizedBox()
                              ),
                              Expanded(
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      IconButton(
                                          onPressed: () {
                                            Navigator.pushNamed(context, '/boardStore');
                                          },
                                          icon: Icon(Icons.storefront),
                                          iconSize: screenHeight * 0.08
                                      )
                                    ]
                                )
                              ),
                            ],
                          ),
                        ),
                        Expanded (
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text( '150',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenHeight * 0.03),
                                ),
                                SizedBox(width: screenWidth * 0.02),
                                Icon(Icons.pets, size: 20, color: Colors.amber),
                                SizedBox(width: screenWidth * 0.04),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 6,
                          child: Image.asset('assets/common/logo/logo.png'),
                        ),
                        Expanded (
                          child: Text('GATOVID',
                            style: TextStyle(
                              fontFamily: 'ShortStack',
                              fontWeight: FontWeight.bold,
                              fontSize: screenHeight * 0.05,
                            )
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                            child: SizedBox()
                        ),
                        Expanded (
                          flex: 3,
                          child: Row(
                            children: [
                              Expanded(
                                  child: SizedBox()
                              ),
                              Expanded(
                                  flex: 8,
                                child: ElevatedButton(
                                    onPressed: () {
                                      showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (BuildContext context) => ReadyGame(),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary: Color(0xFF6A1B9A),
                                        onPrimary: Colors.white,
                                    ),
                                    child: Text(
                                      "Crear partida privada",
                                      style:
                                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                                    )
                                ),
                              ),
                              Expanded(
                                  child: SizedBox()
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            child: SizedBox()
                        ),
                        Expanded (
                          flex: 3,
                          child: Row(
                            children: [
                              Expanded(
                                  child: SizedBox()
                              ),
                              Expanded(
                                flex: 8,
                                child: ElevatedButton(
                                    onPressed: () {
                                      showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (BuildContext context) => GameCode(),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary: Color(0xFF6A1B9A),
                                        onPrimary: Colors.white,
                                    ),
                                    child: Text(
                                      "Unirse a partida privada",
                                      style:
                                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                                    )
                                ),
                              ),
                              Expanded(
                                  child: SizedBox()
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            child: SizedBox()
                        ),
                        Expanded (
                          flex: 3,
                          child: Row(
                            children: [
                              Expanded(
                                  child: SizedBox()
                              ),
                              Expanded(
                                flex: 8,
                                child: ElevatedButton(
                                    onPressed: () {
                                      //TODO: unirse partida pública
                                      //y mostrar dialog alert hasta que se cargue pantalla tablero
                                      showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (BuildContext context) => LoadingGame(),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary: Color(0xFF6A1B9A),
                                        onPrimary: Colors.white,
                                    ),
                                    child: Text(
                                      "Unirse a partida pública",
                                      style:
                                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                                    )
                                ),
                              ),
                              Expanded(
                                  child: SizedBox()
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                            child: SizedBox()
                        ),
                      ],
                    ),
                  ),
                )
          ],
        ),
      ),
    ));
  }
}
