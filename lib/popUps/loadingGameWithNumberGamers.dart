import 'package:flutter/material.dart';
import 'package:gatovidapp/services/models.dart';
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
    return WillPopScope(
        onWillPop: () async => false,
        child: new AlertDialog(
          title: Text(
            'Preparando partida...',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.06,
              fontWeight: FontWeight.bold,
              color: blackWords,
            ),
          ),
          actions: [
            Center(
              child: CircularProgressIndicator(),
            ),
            Center(
              child: Text(
                numGamers.toString() + '/6 gaticos preparados',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  fontWeight: FontWeight.normal,
                  color: blackWords,
                ),
              ),
            ),
          ],
        ));
  }

  @override
  void dispose() {
    super.dispose();
    streamSubscription.cancel();
  }
}
