import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent[700],
        title: Text('Inicio de sesión',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(height: 70.0),
            Row (
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 40.0),
                  child: Text(
                    'Email',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 40.0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                          width: 1.0
                      )
                  ),
                  hintText: 'Texto',
                  isDense: true,                      // Added this
                  contentPadding: EdgeInsets.all(14),
                ),
              ),
            ),
            SizedBox(height: 70.0),
            Row (
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 40.0),
                  child: Text(
                    'Contraseña',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 40.0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                          width: 1.0
                      )
                  ),
                  hintText: 'Texto',
                  isDense: true,                      // Added this
                  contentPadding: EdgeInsets.all(14),
                ),
              ),
            ),
            SizedBox(height: 90.0),
            Padding(
                padding: EdgeInsets.only(
                    left: 25.0, right: 25.0),
                child: ElevatedButton(
                    onPressed: (){},
                    style:
                    ElevatedButton.styleFrom(
                        primary: Colors.purple[800],
                        onPrimary: Colors.white,
                        minimumSize: Size(300.0, 50.0)
                    ),
                    child: Text("INICIAR SESIÓN",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0
                      ),
                    )
                )
            ),
            SizedBox(height: 25.0),
            Row (mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 40.0),
                  child: Text(
                    '¿Nuevo en Gatovid?',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0
                    ),
                  ),
                ),
              ],
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 50.0),
                child: ElevatedButton(
                    onPressed: (){},
                    style:
                    ElevatedButton.styleFrom(
                        primary: Colors.purple[800],
                        onPrimary: Colors.white,
                        minimumSize: Size(200.0, 40.0)
                    ),
                    child: Text("Crear una cuenta",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0
                      ),
                    )
                )
            ),
          ],
        ),
      ),
    );
  }
}
    

