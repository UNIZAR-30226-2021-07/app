import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gatovidapp/partidas/expandedPlayer.dart';
import 'package:gatovidapp/popUps/gamePaused.dart';
import 'package:gatovidapp/services/models.dart';
import 'package:gatovidapp/services/websockets.dart';
import 'package:gatovidapp/partidas/hand.dart';
import 'package:gatovidapp/partidas/body.dart';
import 'package:gatovidapp/partidas/playersTable.dart';
import 'package:gatovidapp/partidas/timer.dart';
import 'dart:async';

class CardBoard extends StatefulWidget {
  @override
  _CardBoardState createState() => _CardBoardState();
}

class _CardBoardState extends State<CardBoard> {
  StreamSubscription<bool> streamSubscription;

  @override
  void initState() {
    super.initState();
    expansion = 0;
    streamSubscription = streamGame.listen((data) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    String boardPath =
        boardList[globalData.board]['image'].replaceAll('svg', 'png');
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/common/" + boardPath),
              fit: BoxFit.cover,
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.05,
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
                              controlTimer.add(false); // TODO: QUITAR ESTO
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
                              controlTimer.add(true); // TODO: QUITAR ESTO
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
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: ((expansion == 0)
                        ? PlayersTableTemplate(
                            height: MediaQuery.of(context).size.height * 0.5,
                            width: MediaQuery.of(context).size.width)
                        : expandedPlayer(context))
                    //child: (expanded? expandedPlayer(context, expanded): playersTable(context))
                    ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.05,
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width * 0.33,
                          height: MediaQuery.of(context).size.height * 0.04,
                          color: Colors.deepPurple,
                          child: Text(
                            "Boton pasar",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          )),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.34,
                          height: MediaQuery.of(context).size.height * 0.04,
                          color: Colors.pinkAccent,
                          child: TimerTemplate(
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: MediaQuery.of(context).size.height * 0.04,
                          )),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.33,
                          height: MediaQuery.of(context).size.height * 0.04,
                          color: Colors.grey,
                          child: Text(
                            "Descartes",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          )),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.13,
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
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.14,
                  child: HandTemplate(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.14,
                      //TODO: la lista con la info del servidor
                      listCard: [0, 4, 5]),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    streamSubscription.cancel();
  }
}
