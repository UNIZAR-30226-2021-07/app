import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gatovidapp/services/auth.dart';
import 'package:gatovidapp/popUps/error.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  final AuthService _authService = AuthService();
  //Controladores para guardar texto formulario
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pwd = TextEditingController();
  final TextEditingController _pwdControl = TextEditingController();
  final TextEditingController _name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenHeight = screenSize.height;
    double screenWidth = screenSize.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF64DD17),
        title: Text(
          'Crear una cuenta',
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
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height - AppBar().preferredSize.height,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Expanded(
                      flex: 4,
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
                                          children: <Widget>[
                                            Expanded(
                                                child: SizedBox()
                                            ),
                                            Expanded(
                                              flex: 6,
                                              child: Text(
                                                'Nombre de usuario',
                                                style:
                                                TextStyle(fontWeight: FontWeight.bold, fontSize: screenHeight * 0.03),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: screenHeight * 0.005),
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
                                                controller: _name,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(10),
                                                      borderSide: BorderSide(width: 2)
                                                  ),
                                                  hintText: 'Introduzca nombre de usuario',
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  isDense: true, // Added this
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
                                          TextStyle(fontWeight: FontWeight.bold, fontSize: screenHeight * 0.03),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.005),
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
                                            controller: _pwd,
                                            // Para ocultar la contraseña
                                            autocorrect: false,
                                            enableSuggestions: false,
                                            obscureText: true,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(10),
                                                  borderSide: BorderSide(width: 2)),
                                              hintText: 'Introduzca contraseña',
                                              filled: true,
                                              fillColor: Colors.white,
                                              isDense: true, // Added this
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
                                          'Repetir contraseña',
                                          style:
                                          TextStyle(fontWeight: FontWeight.bold, fontSize: screenHeight * 0.03),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.005),
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
                                            controller: _pwdControl,
                                            // Para ocultar la contraseña
                                            autocorrect: false,
                                            enableSuggestions: false,
                                            obscureText: true,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(10),
                                                  borderSide: BorderSide(width: 2)),
                                              hintText: 'Introduzca contraseña',
                                              filled: true,
                                              fillColor: Colors.white,
                                              isDense: true, // Added this
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
                                                TextStyle(fontWeight: FontWeight.bold, fontSize: screenHeight * 0.03),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: screenHeight * 0.005),
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
                                                controller: _email,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(10),
                                                      borderSide: BorderSide(width: 2)
                                                  ),
                                                  hintText: 'Introduzca email',
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  isDense: true, // Added this
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
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
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
                                                        onPressed: () async {
                                                          if ( await _authService.signup(_email.text, _pwd.text, _name.text)){
                                                            Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
                                                          }
                                                          else {
                                                            showDialog(
                                                              barrierDismissible: false,
                                                              context: context,
                                                              builder: (BuildContext context) => ErrorPopup(),
                                                            );
                                                          }
                                                        },
                                                        style: ElevatedButton.styleFrom(
                                                            primary: Color(0xFF6A1B9A),
                                                            onPrimary: Colors.white,
                                                            minimumSize: Size(double.infinity, screenHeight * 0.07)),
                                                        child: Text(
                                                          "REGISTRARSE",
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
                                        flex: 2,
                                          child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '¿Ya tienes cuenta?',
                                                  style:
                                                  TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.04 ),
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
                                              children: <Widget>[
                                                Expanded(
                                                    child: SizedBox()
                                                ),
                                                Expanded(
                                                    flex: 2,
                                                    child: ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.pop(context);
                                                        },
                                                        style: ElevatedButton.styleFrom(
                                                            primary: Color(0xFF9C4DCC),
                                                            onPrimary: Colors.white,
                                                            minimumSize: Size(double.infinity, screenHeight * 0.06)),
                                                        child: Text(
                                                          "Iniciar sesión",
                                                          style: TextStyle(
                                                              fontWeight: FontWeight.bold, fontSize: screenHeight * 0.03),
                                                        )
                                                    )
                                                ),
                                                Expanded(
                                                    child: SizedBox()
                                                ),
                                              ]
                                          )
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
        ),
      ),
    );
  }
}
