import 'package:flutter/material.dart';

class genericPopUp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      title: Text('Titulo Pop-Up'),
      content: Text('Contenido del pop-Up'),
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
/*
How to use in a button:

onPressed: () {
  showDialog(
    context: context,
    builder: (BuildContext context) => genericPopUp(),
  );
}

*/
