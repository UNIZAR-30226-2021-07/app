import 'package:flutter/material.dart';
import 'package:gatovidapp/services/models.dart';
import 'dart:async';

const COUNT_DOWN_SEGS = 30;
Timer _timer;
const oneSec = const Duration(seconds: 1);
int _start = 0;

Color purpleColor = Color(0xff6A1B9A);

 class TimerTemplate extends StatefulWidget {
   final width;
   final height;
   bool myTurn;
    TimerTemplate({this.width, this.height,this.myTurn});


   @override
   _TimerTemplate createState() => _TimerTemplate(this.width, this.height, this.myTurn);
 }

 class _TimerTemplate extends State<TimerTemplate> {
   StreamSubscription<bool> streamSubscription;
   double width;
   double height;
   bool myTurn;

   @override
   void initState() {
     super.initState();
     streamSubscription = streamTimer.listen((data) {
       if (data == true){
         print('es de nuevo mi turno');
         print('es mi turno');
         _start = COUNT_DOWN_SEGS;
         this.myTurn = true;
         startTimer();
         setState(() {});
       }
       else{
         try {
           _timer.cancel();
         }
         catch (e) {}
         print('sigue sin ser mi turno');
         _start = 0;
         this.myTurn = false;
         setState(() {});
         print('no es mi turno');
       }
     });
   }

   _TimerTemplate(width, height, myTurn) {
     this.width = width;
     this.height = height;
     this.myTurn = myTurn;
     if (myTurn == true) {
       print('es mi turno');
       _start = COUNT_DOWN_SEGS;
       startTimer();
     } else {
       _start = 0;
       print('no es mi turno');
     }
   }

   void startTimer() {
     print('comenzando timer con $_start');
     try {
       _timer.cancel();
     }
     catch (e) {}
     _timer = new Timer.periodic(
       oneSec,
           (Timer timer) {
         if (_start == 0) {
           setState(() {
             print('se acabo el turno');
             timer.cancel();
           });
         } else {
           setState(() {
             print('inicio del turno');
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
           style: TextStyle(color: Colors.white,
               fontWeight: FontWeight.bold, fontSize: 20),
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
         style: TextStyle(color: Colors.white,
             fontWeight: FontWeight.bold, fontSize: 20),
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