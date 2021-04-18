import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gatovidapp/popUps/gameCode.dart';
import 'package:gatovidapp/popUps/loadingGame.dart';
import 'package:gatovidapp/popUps/readyGame.dart';
import 'package:gatovidapp/popUps/error.dart';
import 'package:gatovidapp/services/profile_stadistics.dart';
import 'package:gatovidapp/services/models.dart';
import 'package:gatovidapp/services/websockets.dart';
import 'dart:async';

Color borderAvatar = Color(0xff6a1b9a);

class GamesMenu extends StatefulWidget {
  @override
  _GamesMenuState createState() => _GamesMenuState();
}

class _GamesMenuState extends State<GamesMenu> {

  StreamSubscription<bool> streamSubscription;
  StreamSubscription<bool> streamSubscription2;
  StreamSubscription<bool> streamSubscription3;

  @override
  void initState() {
    super.initState();
    streamSubscription = streamStartGame.listen((data) {
      if (data == true){
        Navigator.of(context).popUntil((route) => route.isFirst);
        Navigator.pushReplacementNamed(context, '/board');
      }
      else{
        Navigator.pop(context);
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) => ErrorPopup(),
        );
      }
    });
    streamSubscription2 = streamCreateGame.listen((data) {
        Navigator.of(context).popUntil((route) => route.isFirst);
        showDialog(
          context: context,
          builder: (BuildContext context) => ReadyGame(),
        );
    });
    streamSubscription3 = streamGoToLogin.listen((_) {
      disconnectWebSocket();
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

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
                                child: Container(
                                  margin: EdgeInsets.only(left: screenWidth*0.04, top: screenHeight*0.01),
                                  child: CircleAvatar(
                                    radius:screenHeight * 0.045 ,
                                    backgroundColor: borderAvatar,
                                    child:CircleAvatar(
                                      backgroundImage: AssetImage(("assets/common/")+picsList[globalData.picture]['image']),
                                      radius: screenHeight * 0.04,
                                      child: TextButton(
                                          onPressed: () async {
                                            await  getStadistics();
                                            Navigator.pushNamed(context, '/profile');
                                            setState(() {});
                                          }
                                      ),
                                    ),
                                  ),
                                )
                              ),
                              Expanded(
                                flex: 3,
                                child: SizedBox()
                              ),
                              Expanded(
                                 child : Container(
                                   margin: EdgeInsets.only(right: screenWidth*0.03, top: screenHeight*0.005),
                                   child: IconButton(
                                        onPressed: () {
                                          Navigator.pushNamed(context, '/boardStore');
                                        },
                                        icon: Icon(Icons.storefront),
                                        iconSize: screenHeight * 0.08
                                    ),
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
                                Text(globalData.coins,
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenHeight * 0.03),
                                ),
                                SizedBox(width: screenWidth * 0.02),
                                Icon(Icons.pets, size: screenHeight * 0.03, color: Colors.amber),
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
                              fontSize: screenWidth * 0.085,
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
                                      messages.clear();
                                      numGamers = 1;
                                      createGame();
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
                                      "Crear partida privada",
                                      style:
                                      TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.05),
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
                                      messages.clear();
                                      numGamers = 1;
                                      showDialog(
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
                                      TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.05),
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
                                      messages.clear();
                                      numGamers = 1;
                                      publicGame();
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
                                      TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.05),
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

  @override
  void dispose() {
    super.dispose();
    streamSubscription.cancel();
    streamSubscription2.cancel();
    streamSubscription3.cancel();
  }
}
