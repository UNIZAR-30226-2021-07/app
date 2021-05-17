import 'package:flutter/material.dart';

class Classification extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenHeight = screenSize.height;
    double screenWidth = screenSize.width;

    return new AlertDialog(
      title: Text('Resultados', textAlign: TextAlign.center),
      //content:
      actions: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(children: [
              Expanded(child: SizedBox()),
              Expanded(
                child: Image(image: AssetImage("assets/common/logo/logo.png"))
              ),
              Expanded(child: SizedBox()),
              Expanded(
                  flex: 4,
                  //TODO: variable jugador
                  child: Text("Jugador 1",
                      style: TextStyle(fontSize: 20.0))),
              Expanded(child: SizedBox()),
              Expanded(
                  //TODO: variable puntuacion
                  child: Text("50",
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold))),
              Expanded(
                child: Icon(Icons.pets,
                    size: screenHeight * 0.03, color: Colors.amber),
              ),
              Expanded(child: SizedBox())
            ])
          ],
        ),
        Expanded(child: SizedBox(height: screenHeight * 0.03)),
        ElevatedButton(
            child: const Text(
              "Cerrar",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              primary: Color(0xff6a1b9a),
              onPrimary: Colors.white,
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
              minimumSize: Size(MediaQuery.of(context).size.width,
                  MediaQuery.of(context).size.height * 0.075),
              shadowColor: Colors.black,
              side: BorderSide(color: Colors.white, width: 2),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ],
    );
  }
}
