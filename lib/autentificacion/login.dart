import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;
    double screenHeight = screenSize.height;
    double screenWidth = screenSize.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.05), BlendMode.dstATop),
                image: AssetImage("assets/images/bg.png"),
                fit: BoxFit.cover)
              ),
          child: Column(
            children: <Widget>[
              Expanded(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  flex: 2,
                                  child: SizedBox(
                                  )
                                ),
                                Expanded(
                                  child: Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                            child: SizedBox()
                                        ),
                                        Expanded(
                                          flex: 6,
                                          child: Text(
                                            'Email',
                                            style:
                                            TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                            child: SizedBox()
                                        ),
                                        Expanded(
                                          flex: 6,
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(screenWidth * 0.03),
                                                  borderSide: BorderSide(width: screenWidth * 0.03)),
                                              hintText: 'Introduzca email',
                                              isDense: true, // Added this
                                              contentPadding: EdgeInsets.all(14),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                            child: SizedBox()
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                      ),
                      Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                    flex: 2,
                                    child: SizedBox(
                                    )
                                ),
                                Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                            child: SizedBox()
                                        ),
                                        Expanded(
                                          flex: 6,
                                          child: Text(
                                            'Contraseña',
                                            style:
                                            TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                            child: SizedBox()
                                        ),
                                        Expanded(
                                          flex: 6,
                                          child: TextFormField(
                                            // Para ocultar la contraseña
                                            autocorrect: false,
                                            enableSuggestions: false,
                                            obscureText: true,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(screenWidth * 0.03),
                                                  borderSide: BorderSide(width: screenWidth * 0.03)),
                                              hintText: 'Introduzca contraseña',
                                              isDense: true, // Added this
                                              contentPadding: EdgeInsets.all(14),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                            child: SizedBox()
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                      ),
                    ],
                  ),
              ),
              Expanded(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Expanded(
                                      child: Container(
                                      )
                                  ),
                                  Expanded(
                                    child:
                                      Container(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                                child: SizedBox()
                                            ),
                                            Expanded(
                                                flex: 6,
                                                child: ElevatedButton(
                                                    onPressed: () {
                                                      // NOTE: esto es temporal
                                                      Navigator.pushReplacementNamed(context, '/home');
                                                    },
                                                    style: ElevatedButton.styleFrom(
                                                        primary: Color(0xFF6A1B9A),
                                                        onPrimary: Colors.white,
                                                        minimumSize: Size(double.infinity, screenHeight * 0.07)),
                                                    child: Text(
                                                      "INICIAR SESIÓN",
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold, fontSize: screenHeight * 0.04),
                                                    )
                                                )
                                                ),
                                            Expanded(
                                                child: SizedBox()
                                            ),
                                          ],
                                        ),
                                      ),
                                  ),
                                ],
                              ),
                            )
                        ),
                        Expanded(
                          flex: 2,
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                    child: SizedBox()
                                ),
                                Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '¿Nuevo en Gatovid?',
                                          style:
                                          TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.045 ),
                                        ),
                                    ])
                                ),
                                Expanded(
                                    child: SizedBox()
                                ),
                                Expanded(
                                  flex: 2,
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                        Expanded(
                                        child: SizedBox()
                                        ),
                                        Expanded(
                                          flex: 2,
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pushNamed(context, '/register');
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    primary: Color(0xFF9C4DCC),
                                                    onPrimary: Colors.white,
                                                    minimumSize: Size(double.infinity, screenHeight * 0.06)),
                                                child: Text(
                                                  "Crear una cuenta",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold, fontSize: screenHeight * 0.03),
                                                )
                                            )
                                        ),
                                        Expanded(
                                            child: SizedBox()
                                        ),
    ]                               )
                                ),
                              ],
                            )
                        ),
                        Expanded(
                            child: Container(
                            )
                        ),
                      ],
                    ),
                  )
              ),
          ]
          ),
        ),
      ),
    );
  }
}
