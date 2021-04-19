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
            ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height* 0.14,
                    maxWidth: MediaQuery.of(context).size.width* 0.8),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    Expanded(flex: 1, child: SizedBox()),
                    Expanded(
                        flex: 4,
                        child: Column(
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                            Text(
                              numGamers.toString() + '/6 gaticos preparados',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width * 0.05,
                                fontWeight: FontWeight.normal,
                                color: blackWords,
                              ),
                            ),
                          ],
                        )
                    ),
                    Expanded(flex: 1, child: SizedBox()),
                  ]
              ),
            )
          ],
        ));
  }

  @override
  void dispose() {
    super.dispose();
    streamSubscription.cancel();
  }
}
