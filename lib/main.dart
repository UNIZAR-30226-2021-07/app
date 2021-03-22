import 'package:flutter/material.dart';
import 'package:gatovidapp/autentificacion/signup.dart';
import 'package:gatovidapp/autentificacion/login.dart';
import 'package:gatovidapp/chat/chat.dart';
import 'package:gatovidapp/menuPartidas/menu.dart';
import 'package:gatovidapp/perfil/profile.dart';
import 'package:gatovidapp/perfil/profileConf.dart';

void main() => runApp(
      MaterialApp(
        title: 'Gatovid',
        initialRoute: '/',
        routes: {
          '/': (context) => Landing(),
          '/login': (context) => Login(),
          '/register': (context) => Signup(),
          '/home': (context) => GamesMenu(),
        },
      ),
    );

checkIfAuthenticated() async {
  await Future.delayed(Duration(seconds: 3)); // simulación de obtener la sesión
  return false;
}

// Landing decide si acceder a la página de login
// o al menú si está loggeado.
class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    checkIfAuthenticated().then((success) {
      if (success) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        Navigator.pushReplacementNamed(context, '/login');
      }
    });

    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
