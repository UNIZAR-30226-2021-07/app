import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gatovidapp/services/auth.dart';
import 'package:gatovidapp/services/models.dart';
import 'package:gatovidapp/services/persistance.dart';
import 'package:gatovidapp/popUps/error.dart';
import 'package:gatovidapp/services/profile_stadistics.dart';
import 'package:gatovidapp/services/websockets.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _authService = AuthService();
  //Controladores para guardar texto formulario
  final TextEditingController _mail = TextEditingController();
  final TextEditingController _pwd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenHeight = screenSize.height;
    double screenWidth = screenSize.width;

    return Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color(0xFF64DD17),
        title: Text(
          'Inicio de sesión',
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
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0.05), BlendMode.dstATop),
                  image: AssetImage("assets/images/bg.png"),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: (MediaQuery.of(context).size.height -
                        AppBar().preferredSize.height) *
                    0.95,
              ),
              child: Column(children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Expanded(flex: 2, child: SizedBox()),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(child: SizedBox()),
                                  Expanded(
                                    flex: 6,
                                    child: Text(
                                      'Email',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: screenWidth * 0.04),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(child: SizedBox()),
                                  Expanded(
                                    flex: 6,
                                    child: TextFormField(
                                      controller: _mail,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(width: 2)),
                                        hintText: 'Introduzca email',
                                        filled: true,
                                        fillColor: Colors.white,
                                        isDense: true, // Added this
                                        contentPadding: EdgeInsets.all(14),
                                      ),
                                    ),
                                  ),
                                  Expanded(child: SizedBox()),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Expanded(flex: 2, child: SizedBox()),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(child: SizedBox()),
                                  Expanded(
                                    flex: 6,
                                    child: Text(
                                      'Contraseña',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: screenWidth * 0.04),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(child: SizedBox()),
                                  Expanded(
                                    flex: 6,
                                    child: TextFormField(
                                      // Para ocultar la contraseña
                                      autocorrect: false,
                                      enableSuggestions: false,
                                      obscureText: true,
                                      controller: _pwd,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(width: 2)),
                                        hintText: 'Introduzca contraseña',
                                        filled: true,
                                        fillColor: Colors.white,
                                        isDense: true, // Added this
                                        contentPadding: EdgeInsets.all(14),
                                      ),
                                    ),
                                  ),
                                  Expanded(child: SizedBox()),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: <Widget>[
                            Expanded(child: Container()),
                            Expanded(
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(child: SizedBox()),
                                    Expanded(
                                        flex: 6,
                                        child: ElevatedButton(
                                            onPressed: () async {
                                              //Comprobación inicio sesión
                                              if (await _authService.login(
                                                  _mail.text, _pwd.text)) {
                                                setValuesPersistence();
                                                await readPicsJson();
                                                await readBoardsJson();
                                                await getData();
                                                startWebSocket();
                                                Navigator.pushReplacementNamed(
                                                    context, '/home');
                                              } else {
                                                showDialog(
                                                  barrierDismissible: false,
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) =>
                                                          ErrorPopup(),
                                                );
                                              }
                                            },
                                            style: ElevatedButton.styleFrom(
                                                primary: Color(0xFF6A1B9A),
                                                onPrimary: Colors.white,
                                                minimumSize: Size(
                                                    double.infinity,
                                                    screenHeight * 0.07)),
                                            child: Text(
                                              "INICIAR SESIÓN",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: screenWidth * 0.07),
                                            ))),
                                    Expanded(child: SizedBox()),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: Column(
                            children: <Widget>[
                              Expanded(child: SizedBox()),
                              Expanded(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                    Text(
                                      '¿Nuevo en Gatovid?',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: screenWidth * 0.045),
                                    ),
                                  ])),
                              Expanded(child: SizedBox()),
                              Expanded(
                                  flex: 2,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(child: SizedBox()),
                                        Expanded(
                                            flex: 2,
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pushNamed(
                                                      context, '/register');
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    primary: Color(0xFF9C4DCC),
                                                    onPrimary: Colors.white,
                                                    minimumSize: Size(
                                                        double.infinity,
                                                        screenHeight * 0.06)),
                                                child: Text(
                                                  "Crear una cuenta",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize:
                                                          screenWidth * 0.05),
                                                ))),
                                        Expanded(child: SizedBox()),
                                      ])),
                            ],
                          )),
                      Expanded(child: Container()),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
