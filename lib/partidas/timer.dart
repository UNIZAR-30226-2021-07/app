import 'package:flutter/material.dart';
import 'package:gatovidapp/services/models.dart';
import 'dart:async';

const COUNT_DOWN_SEGS = 30;
Timer _timer;
const oneSec = const Duration(seconds: 1);
int _start = 0;
bool myTurn = false;

Color purpleColor = Color(0xff6A1B9A);

class TimerTemplate extends StatefulWidget {
  final width;
  final height;

  TimerTemplate({this.width, this.height});

  @override
  _TimerTemplate createState() => _TimerTemplate(this.width, this.height);
}

class _TimerTemplate extends State<TimerTemplate> {
  StreamSubscription<bool> streamSubscription;
  double width;
  double height;

  @override
  void initState() {
    super.initState();
    streamSubscription = streamTimer.listen((data) {
      if (data == true) {
        _start = COUNT_DOWN_SEGS;
        myTurn = true;
        startTimer();
        setState(() {});
      } else {
        try {
          _timer.cancel();
        } catch (e) {}
        _start = 0;
        myTurn = false;
        setState(() {});
      }
    });
  }

  _TimerTemplate(width, height) {
    this.width = width;
    this.height = height;
    myTurn = false;
    _start = 0;
  }

  void startTimer() {
    try {
      _timer.cancel();
    } catch (e) {}
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (myTurn == true) {
      return Container(
        height: this.height,
        width: this.width,
        color: Color(0xff6A1B9A),
        alignment: Alignment.center,
        child: Text(
          "$_start",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      );
    }
    return Container(
      height: this.height,
      width: this.width,
      color: Color(0xffC5C5C5),
      alignment: Alignment.center,
      child: Text(
        "$_start",
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    streamSubscription.cancel();
    super.dispose();
  }
}
