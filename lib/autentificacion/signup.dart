import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
    
class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent[700],
        title: Text('Crear una cuenta'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(height: 40.0),
            Row (
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
                  child: Text(
                      'Nombre de usuario'
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Texto',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1.0
                    )
                  )
                ),
              ),
            ),
            SizedBox(height: 25.0),
            Row (
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
                  child: Text(
                      'Contraseña'
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'Texto',
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.0
                        )
                    )
                ),
              ),
            ),
            SizedBox(height: 25.0),
            Row (
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
                  child: Text(
                      'Email'
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'Texto',
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.0
                        )
                    )
                ),
              ),
            ),
            SizedBox(height: 40.0),
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
                child: Text("REGISTRARSE"
                )
              )
            ),
            SizedBox(height: 30.0),
            Row (mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
                  child: Text(
                      '¿Ya tienes cuenta?'
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
                        minimumSize: Size(150.0, 30.0)
                    ),
                    child: Text("Iniciar Sesión"
                    )
                )
            ),
          ],
        ),
      ),
    );
  }
}
    
    
    