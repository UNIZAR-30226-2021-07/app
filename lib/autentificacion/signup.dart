import 'package:flutter/material.dart';
    
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
            SizedBox(height: 20.0),
            TextFormField(
              validator: (value){
                if (value.isEmpty) {
                  return 'Introduzca nombre';
                }
            }
            )
          ],
        ),
      ),
    );
  }
}
    
    
    