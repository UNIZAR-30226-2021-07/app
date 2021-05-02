import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gatovidapp/partidas/expandedPlayer.dart';
import 'package:gatovidapp/popUps/gamePaused.dart';
import 'package:gatovidapp/services/websockets.dart';
import 'package:gatovidapp/partidas/hand.dart';
import 'package:gatovidapp/partidas/body.dart';
import 'package:gatovidapp/partidas/playersTable.dart';

class CardBoard extends StatefulWidget {
  @override
  _CardBoardState createState() => _CardBoardState();
}

class _CardBoardState extends State<CardBoard> {
  bool expanded = true;

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.05), BlendMode.dstATop),
              //TODO: imagen tablero correspondiente
              image: AssetImage("assets/images/bg.png"),
              fit: BoxFit.cover,
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              leaveGame();
                              Navigator.of(context)
                                  .popUntil((route) => route.isFirst);
                              Navigator.pushReplacementNamed(context, '/home');
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.orange,
                                onPrimary: Colors.white,
                                minimumSize: Size(double.infinity, 20)),
                            child: Text(
                              "Salir",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            )),
                      ),
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (BuildContext context) => GamePaused(),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xFF9C4DCC),
                                onPrimary: Colors.white,
                                minimumSize: Size(double.infinity, 20)),
                            child: Text(
                              "Pausa",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            )),
                      ),
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/rules');
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.blue,
                                onPrimary: Colors.white,
                                minimumSize: Size(double.infinity, 20)),
                            child: Text(
                              "Reglas",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            )),
                      ),
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/chat');
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xFF9C4DCC),
                                onPrimary: Colors.white,
                                minimumSize: Size(double.infinity, 20)),
                            child: Text(
                              "Chat",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            )),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    flex: 7,
                    child: (expanded
                        ? PlayersTable(context)
                        : ExpandedPlayer(context, expanded))
                    //child: (expanded? ExpandedPlayer(context, expanded): PlayersTable(context))
                    ),
                Expanded(
                    child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                            color: Colors.deepPurple,
                            child: Text(
                              "Boton pasar",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            )),
                      ),
                      Expanded(
                        child: Container(
                            color: Colors.pinkAccent,
                            child: Text(
                              "Tiempo",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            )),
                      ),
                      Expanded(
                        child: Container(
                            color: Colors.grey,
                            child: Text(
                              "Descartes",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            )),
                      ),
                    ],
                  ),
                )),
                Expanded(
                    flex: 2,
                    child: Container(
                      child: Body(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.13,
                        //TODO:  la lista con la info del servidor
                        listOrgans: [
                          [0],
                          [1, 5, 8],
                          [9, 7],
                          [9, 10, 15]
                        ],
                      ),
                    )),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: HandTemplate(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.15,
                        //TODO: la lista con la info del servidor
                        listCard: [0, 4, 5]),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
