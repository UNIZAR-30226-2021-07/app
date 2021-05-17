import 'package:flutter/material.dart';
import 'package:gatovidapp/popUps/classificationTable.dart';

class Classification extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenHeight = screenSize.height;

    return WillPopScope(
      onWillPop: () async => false,
      child: AlertDialog(
        title: Text('Resultados',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold)),
        //content:
        actions: <Widget>[
          classificationTable(context),
          Container(child: SizedBox(height: screenHeight * 0.05)),
          Container(
            width: screenSize.width,
            child: Row(
              children: [
                Expanded(child: SizedBox()),
                Expanded(
                  flex: 4,
                  child: ElevatedButton(
                    child: const Text(
                      "Cerrar",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff6a1b9a),
                      onPrimary: Colors.white,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                      minimumSize: Size(MediaQuery.of(context).size.width * 0.2,
                          MediaQuery.of(context).size.height * 0.075),
                      shadowColor: Colors.black,
                      side: BorderSide(color: Colors.white, width: 2),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/', (Route<dynamic> route) => false);
                    },
                  ),
                ),
                Expanded(child: SizedBox())
              ],
            ),
          )
        ],
      ),
    );
  }
}
