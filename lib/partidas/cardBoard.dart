import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gatovidapp/partidas/expandedPlayer.dart';
import 'package:gatovidapp/partidas/bottomBoard.dart';
import 'package:gatovidapp/popUps/gamePaused.dart';
import 'package:gatovidapp/popUps/gamePausedOthers.dart';
import 'package:gatovidapp/services/models.dart';
import 'package:gatovidapp/services/websockets.dart';
import 'package:gatovidapp/partidas/playersTable.dart';
import 'package:gatovidapp/partidas/upButtons.dart';
import 'package:simple_timer/simple_timer.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_restart/flutter_restart.dart';
import 'package:gatovidapp/popUps/classification.dart';
import 'package:gatovidapp/popUps/error.dart';
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
  StreamSubscription<bool> streamSubscription2;
  StreamSubscription<bool> streamSubscription3;
  StreamSubscription<bool> streamSubscription4;
  StreamSubscription<bool> streamSubscription5;
  TimerController _timerController;

  @override
  void initState() {
    super.initState();
    expansion = 0;
    _timerController = TimerController(this);
    playerSelectedtransplant = '';
    if (isMyTurn) {
      playedGloves = false;
      notAgain = false;
      new Timer(const Duration(milliseconds: 1000), () {
        setState(() {
          _timerController.restart(
              startFrom: Duration(seconds: timerValue - 1));
          timerValue = COUNT_DOWN_SEGS;
        });
      });
      colorBase = purpleColor;
    }
    // Not my turn
    else {
      playedGloves = false;
      notAgain = true;
      colorBase = greyColor;
    }

    streamSubscription = streamGame.listen((data) {
      print('My turn -> ' + isMyTurn.toString());
      // Reset treatment
      playerSelectedtransplant = '';

      if (gameEnded == true) {
        _timerController.reset();
        colorBase = greyColor;
        gameEnded = false;
        showDialog(
          context: context,
          builder: (BuildContext context) => Classification(),
        );
      }
      if (expulsadoGame == true) {
        leaveGame();
        Navigator.of(context).popUntil((route) => route.isFirst);
        Navigator.pushReplacementNamed(context, '/home');
      }

      // My turn
      if (isMyTurn && notAgain) {
        _timerController.restart(startFrom: Duration(seconds: timerValue));
        timerValue = COUNT_DOWN_SEGS;
        colorBase = purpleColor;
        notAgain = false;
        playedGloves = false;
      } else if (isMyTurn && playedGloves) {
        _timerController.restart(startFrom: Duration(seconds: timerValue));
        timerValue = COUNT_DOWN_SEGS;
        colorBase = purpleColor;
        notAgain = false;
        playedGloves = false;
      }
      // Not my turn
      else if (isMyTurn) {
        /*nothing*/
      } else {
        timerValue = COUNT_DOWN_SEGS;
        _timerController.reset();
        colorBase = greyColor;
      }
      print(timerValue.toString());
      setState(() {});
    });

    streamSubscription2 = streamPaused.listen((data) {
      if (data == true) {
        if (isMyTurn) {
          _timerController.pause();
        }
        showDialog(
          context: context,
          builder: (BuildContext context) => GamePausedOthers(),
        );
      } else {
        // false
        if (isMyTurn) {
          _timerController.start();
        }
        Navigator.of(context).popUntil((route) => route.isFirst);
      }
    });

    streamSubscription3 = streamPausedMe.listen((data) {
      if (data == true) {
        if (isMyTurn) {
          _timerController.pause();
        }
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) => GamePaused(),
        );
      } else {
        // false
        if (isMyTurn) {
          _timerController.start();
        }
        Navigator.of(context).popUntil((route) => route.isFirst);
      }
    });
    streamSubscription4 = streamBan.listen((data) {
      print('BANNED PLAYER');
      FlutterRestart.restartApp();
    });
    streamSubscription5 = streamErrorCard.listen((data) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => ErrorPopup(),
      );
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
                  child: UpButtons(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: ((expansion == 0)
                        ? PlayersTableTemplate(
                            height: MediaQuery.of(context).size.height * 0.5,
                            width: MediaQuery.of(context).size.width)
                        : expandedPlayer(context))),
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
                            duration: Duration(seconds: COUNT_DOWN_SEGS),
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
                        color: Color(0x88655F5F),
                        alignment: Alignment.center,
                        child: DragTarget<CardData>(
                          builder: (context, candidateItems, rejectedItems) {
                            return DottedBorder(
                              color: Colors.white,
                              strokeWidth: 1,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                height:
                                    MediaQuery.of(context).size.height * 0.055,
                                alignment: Alignment.center,
                                child: Text(
                                  "Descartar",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
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
                  child: bottomBoard(context),
                )
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
    streamSubscription2.cancel();
    streamSubscription3.cancel();
    streamSubscription4.cancel();
    streamSubscription5.cancel();
  }

  void handleTimerOnStart() {
    print("timer has just started");
  }

  void handleTimerOnEnd() {
    print("timer has ended");
  }
}
