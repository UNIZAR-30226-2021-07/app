import 'package:flutter/material.dart';
import 'package:simple_timer/simple_timer.dart';

const COUNT_DOWN_SEGS = 30;

Color purpleColor = Color(0xff6A1B9A);

class TimerTemplate extends StatefulWidget {
  final width;
  final height;
  final turnOk;

  TimerTemplate({this.width, this.height, this.turnOk});

  @override
  _TimerTemplate createState() => _TimerTemplate(
      width: this.width, height: this.height, turnOk: this.turnOk);
}

class _TimerTemplate extends State<TimerTemplate>
    with SingleTickerProviderStateMixin {
  final width;
  final height;
  final turnOk;

  TimerController _timerController;

  _TimerTemplate({this.width, this.height, this.turnOk});

  @override
  void initState() {
    // initialize timercontroller
    _timerController = null;
    super.initState();
  }

  String durationToSeconds(Duration duration) {
    return "${(duration.inSeconds.remainder(60))}";
  }

  @override
  Widget build(BuildContext context) {
    if (this.turnOk == true) {
      return Container(
        height: this.height,
        width: this.width,
        color: Color(0xff6A1B9A),
        alignment: Alignment.center,
        child: SimpleTimer(
          duration: const Duration(seconds: COUNT_DOWN_SEGS),
          controller: _timerController,
          onStart: handleTimerOnStart,
          onEnd: handleTimerOnEnd,
          status: TimerStatus.start,
          timerStyle: TimerStyle.expanding_segment,
          progressIndicatorColor: Color(0xff6A1B9A),
          valueListener: timerValueChangeListener,
          backgroundColor: Color(0xff6A1B9A),
          progressTextFormatter: durationToSeconds,
          progressTextStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: this.width * 0.2),
        ),
      );
    }
    return Container(
      height: this.height,
      width: this.width,
      color: Color(0xffC5C5C5),
      alignment: Alignment.center,
      child: Text(
        "0",
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: this.width * 0.2),
      ),
    );
  }

  void timerValueChangeListener(Duration timeElapsed) {}

  void handleTimerOnStart() {
    print("timer has just started");
  }

  void handleTimerOnEnd() {
    print("timer has ended");
  }
}
