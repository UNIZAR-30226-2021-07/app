import 'package:flutter/material.dart';

class Classification extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;
    double screenHeight = screenSize.height;
    double screenWidth = screenSize.width;

    return new AlertDialog(
      title: Text('Resultados'),
      content: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
             children: [
               Expanded(child: SizedBox()),
               Expanded(
                 child: Icon(Icons.pets,
                     size: screenHeight * 0.03, color: Colors.amber),
               ),
               Expanded(child: SizedBox()),
               Expanded(
                 flex: 3,
                 //TODO: variable jugador
                 child: Text("Jugador 1")
               ),
               Expanded(
                 //TODO: variable puntuacion
                 child: Text("50")
               ),
               Expanded(
                 child: Icon(Icons.pets,
                     size: screenHeight * 0.03, color: Colors.amber),
               ),
             ]
            )
          ],
        ),
      actions: <Widget>[
        new ElevatedButton(
            child: const Text(
              "ok",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.purple,
              onPrimary: Colors.white,
              minimumSize: Size(300.0, 50.0),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ],
    );
  }
}