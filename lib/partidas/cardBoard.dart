import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gatovidapp/partidas/expandedPlayer.dart';
import 'package:gatovidapp/popUps/gamePaused.dart';
import 'package:gatovidapp/services/models.dart';
import 'package:gatovidapp/services/websockets.dart';
import 'package:gatovidapp/partidas/hand.dart';
import 'package:gatovidapp/partidas/body.dart';
import 'package:gatovidapp/partidas/playersTable.dart';
import 'package:simple_timer/simple_timer.dart';
import 'package:dotted_border/dotted_border.dart';
import 'dart:async';

const COUNT_DOWN_SEGS = 30;

String durationToSeconds(Duration duration) {
  return "${(duration.inSeconds.remainder(60))}";
}

class CardBoard extends StatefulWidget {
  @override
  _CardBoardState createState() => _CardBoardState();
}

class _CardBoardState extends State<CardBoard>
    with SingleTickerProviderStateMixin {
  StreamSubscription<bool> streamSubscription;
  TimerController _timerController;

  @override
  void initState() {
    super.initState();
    expansion = 0;
    _timerController = TimerController(this);
    if (isMyTurn) {
      notAgain = false;
      new Timer(const Duration(milliseconds: 1000), () {
        setState(() {
          _timerController.restart(
              startFrom: const Duration(seconds: COUNT_DOWN_SEGS - 1));
        });
      });
      colorBase = purpleColor;
    }
    // Not my turn
    else {
      notAgain = true;
      colorBase = greyColor;
    }

    streamSubscription = streamGame.listen((data) {
      print('My turn -> ' + isMyTurn.toString());
      // My turn
      if (isMyTurn && notAgain) {
        _timerController.restart(
            startFrom: const Duration(seconds: COUNT_DOWN_SEGS));
        colorBase = purpleColor;
        notAgain = false;
      }
      // Not my turn
      else if (isMyTurn) {
        /*nothing*/
      } else {
        _timerController.reset();
        colorBase = greyColor;
      }
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
                  height: MediaQuery.of(context).size.height * 0.06,
                  alignment: Alignment.center,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: MediaQuery.of(context).size.height * 0.06,
                        decoration: BoxDecoration(
                            color: colorBase,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(20.0)),
                        alignment: Alignment.center,
                        child: TextButton(
                          child: Text(
                            "Pasar",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04),
                          ),
                          onPressed: () {
                            passTurn();
                          },
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.05,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.22,
                        height: MediaQuery.of(context).size.height * 0.06,
                        color: Colors.pinkAccent,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.035,
                          width: MediaQuery.of(context).size.width * 0.2,
                          color: colorBase,
                          alignment: Alignment.center,
                          child: SimpleTimer(
                            duration: const Duration(seconds: COUNT_DOWN_SEGS),
                            controller: _timerController,
                            onStart: handleTimerOnStart,
                            onEnd: handleTimerOnEnd,
                            timerStyle: TimerStyle.expanding_segment,
                            progressIndicatorColor: colorBase,
                            backgroundColor: colorBase,
                            progressTextFormatter: durationToSeconds,
                            progressTextStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.05,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: MediaQuery.of(context).size.height * 0.06,
                        decoration: BoxDecoration(
                            color: Color(0x00000000),
                            borderRadius: BorderRadius.circular(20.0)),
                        alignment: Alignment.center,
                        child: DragTarget<CardData>(
                          builder: (context, candidateItems, rejectedItems) {
                            return DottedBorder(
                              color: Colors.black,
                              strokeWidth: 1,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.32,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                alignment: Alignment.center,
                                child: Text(
                                  "Descartar",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.04),
                                ),
                              ),
                            );
                          },
                          onAcceptWithDetails: (data) {
                            return true;
                          },
                          onAccept: (data) {
                            discardCard(data.indice);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.13,
                  child: Body(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.13,
                    listOrgans: bodyOfPlayer,
                    name: globalData.name,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.14,
                  child: HandTemplate(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.14,
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

  @override
  void dispose() {
    super.dispose();
    _timerController.dispose();
    streamSubscription.cancel();
  }

  void handleTimerOnStart() {
    print("timer has just started");
  }

  void handleTimerOnEnd() {
    print("timer has ended");
  }
}
