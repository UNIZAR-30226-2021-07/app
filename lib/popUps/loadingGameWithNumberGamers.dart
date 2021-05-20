import 'package:flutter/material.dart';
import 'package:gatovidapp/services/models.dart';
import 'package:gatovidapp/services/websockets.dart';
import 'dart:async';

Color blackWords = Color(0xff000000);

class LoadingGameWithNG extends StatefulWidget {
  @override
  _LoadingGameWithNG createState() => _LoadingGameWithNG();
}

class _LoadingGameWithNG extends State<LoadingGameWithNG> {
  StreamSubscription<bool> streamSubscription;

  @override
  void initState() {
    super.initState();
    streamSubscription = streamUsersWaiting.listen((data) {
      setState(() {});
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenHeight = screenSize.height;
    double screenWidth = screenSize.width;
    return WillPopScope(
        onWillPop: () async => false,
        child: new AlertDialog(
          actions: [
            Container(
                          height: screenHeight * 0.03,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CloseButton(
                                  onPressed: () {
                                    leaveGame();
                                    Navigator.pop(context);
                                  }
                              )
                            ],
                          ),
                        ),
                        Text(
                          'Preparando partida...',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.050,
                            fontWeight: FontWeight.bold,
                            color: blackWords,
                          ),
                        ),

                        Column(
                              children: [
                                CircularProgressIndicator(),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.03,
                                ),
                                Text(
                                  numGamers.toString() + '/6 gaticos preparados',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width * 0.05,
                                    fontWeight: FontWeight.normal,
                                    color: blackWords,
                                  ),
                                ),
                              ],
                )]));
  }

  @override
  void dispose() {
    super.dispose();
    streamSubscription.cancel();
  }
}
