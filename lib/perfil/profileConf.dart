import 'package:flutter/material.dart';
import 'package:gatovidapp/popUps/deleteAccount.dart';
import 'package:gatovidapp/services/profile_modify.dart';
import 'package:gatovidapp/services/models.dart';
import 'package:gatovidapp/services/websockets.dart';
import 'package:gatovidapp/popUps/error.dart';
import 'package:gatovidapp/services/profile_stadistics.dart';
import 'dart:async';

// Colors to use

Color greenAppBar = Color(0xff64DD17);
Color blackWords = Color(0xff000000);
Color greyWords = Color(0xff717171);
Color purpleButton = Color(0xff6A1B9A);
Color purpleCamera = Color(0xff9C4DCC);
Color whiteWords = Color(0xffffffff);
Color redButton = Color(0xffFF0000);

final TextEditingController _name = TextEditingController();
final TextEditingController _pass1 = TextEditingController();
final TextEditingController _pass2 = TextEditingController();

class ProfileConf extends StatefulWidget {
  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<ProfileConf>
    with SingleTickerProviderStateMixin {
  final FocusNode myFocusNode = FocusNode();
  StreamSubscription<bool> streamSubscription;

  @override
  void initState() {
    super.initState();
    streamSubscription = streamGoToLogin.listen((_) {
      disconnectWebSocket();
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    String boardPath =
        boardList[globalData.board]['image'].replaceAll('svg', 'png');
    return new Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: greenAppBar,
          title: const Text(
            'Configuración',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
                color: Color(0xff000000)),
          ),
          leading: IconButton(
              icon: Icon(Icons.arrow_back_rounded),
              color: blackWords,
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: new Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
            colorFilter: new ColorFilter.mode(
                Colors.white.withOpacity(0.05), BlendMode.dstATop),
            image: AssetImage("assets/images/bg.png"),
            fit: BoxFit.cover,
          )),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: (MediaQuery.of(context).size.height -
                          AppBar().preferredSize.height) *
                      0.95),
              child: new Column(
                children: [
                  Expanded(flex: 2, child: SizedBox()),
                  Expanded(
                    flex: 15,
                    child: new Stack(
                      fit: StackFit.loose,
                      children: <Widget>[
                        new Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: MediaQuery.of(context).size.height * 0.15,
                              child: CircleAvatar(
                                backgroundImage: AssetImage(("assets/common/") +
                                    picsList[globalData.picture]['image']),
                                radius:
                                    MediaQuery.of(context).size.width * 0.04,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.005,
                                left:
                                    MediaQuery.of(context).size.width * 0.525),
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                TextButton(
                                  child: new CircleAvatar(
                                      backgroundColor: purpleCamera,
                                      radius:
                                          MediaQuery.of(context).size.height *
                                              0.03,
                                      child: new Icon(
                                        Icons.camera_alt,
                                        color: whiteWords,
                                        size:
                                            MediaQuery.of(context).size.height *
                                                0.03,
                                      )),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, '/avatarStore');
                                  },
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                  Expanded(flex: 1, child: SizedBox()),
                  Expanded(
                    flex: 9,
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            new Text(globalData.name,
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.05,
                                    fontWeight: FontWeight.bold)),
                            new Text(
                              globalData.email,
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(flex: 1, child: SizedBox()),
                  Expanded(
                    flex: 7,
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tight(Size(
                          MediaQuery.of(context).size.width * 0.8,
                          MediaQuery.of(context).size.height * 0.06)),
                      child: TextFormField(
                        controller: _name,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(width: 1.0)),
                            hintText: 'Cambiar nombre',
                            isDense: true,
                            fillColor: whiteWords,
                            filled: true),
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          fontWeight: FontWeight.normal,
                          color: greyWords,
                        ),
                      ),
                    ),
                  ),
                  Expanded(flex: 1, child: SizedBox()),
                  Expanded(
                    flex: 7,
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tight(Size(
                          MediaQuery.of(context).size.width * 0.8,
                          MediaQuery.of(context).size.height * 0.06)),
                      child: TextFormField(
                        controller: _pass1,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(width: 1.0)),
                            hintText: 'Cambiar contraseña',
                            isDense: true,
                            fillColor: whiteWords,
                            filled: true),
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          fontWeight: FontWeight.normal,
                          color: greyWords,
                        ),
                        // Oculta la contraseña
                        autocorrect: false,
                        enableSuggestions: false,
                        obscureText: true,
                      ),
                    ),
                  ),
                  Expanded(flex: 1, child: SizedBox()),
                  Expanded(
                    flex: 7,
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tight(Size(
                          MediaQuery.of(context).size.width * 0.8,
                          MediaQuery.of(context).size.height * 0.06)),
                      child: TextFormField(
                        controller: _pass2,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(width: 1.0)),
                            hintText: 'Repita la contraseña',
                            isDense: true,
                            fillColor: whiteWords,
                            filled: true),
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          fontWeight: FontWeight.normal,
                          color: greyWords,
                        ),
                        // Oculta la contraseña
                        autocorrect: false,
                        enableSuggestions: false,
                        obscureText: true,
                      ),
                    ),
                  ),
                  Expanded(flex: 1, child: SizedBox()),
                  Expanded(
                    flex: 10,
                    child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Container(
                              constraints: BoxConstraints.tight(Size(
                                  MediaQuery.of(context).size.width * 0.8,
                                  MediaQuery.of(context).size.width * 0.15)),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors
                                        .black45), // No se que color es, Leti no me lo tengas en cuenta
                                borderRadius: BorderRadius.circular(8.0),
                                color: whiteWords, //add it here
                              ),
                              child: new Table(
                                columnWidths: {
                                  0: FlexColumnWidth(7),
                                  1: FlexColumnWidth(3),
                                },
                                children: [
                                  TableRow(children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.022,
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.022,
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.0125,
                                          bottom: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.0125),
                                      child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.08,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.05,
                                          child: Column(children: [
                                            Expanded(
                                                flex: 1, child: SizedBox()),
                                            Expanded(
                                                flex: 6,
                                                child: Text(
                                                  'Cambiar Tablero',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.04,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: greyWords,
                                                  ),
                                                )),
                                            Expanded(
                                                flex: 1, child: SizedBox()),
                                          ])),
                                    ),
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.08,
                                      width: MediaQuery.of(context).size.width *
                                          0.05,
                                      child: Column(children: [
                                        Expanded(flex: 1, child: SizedBox()),
                                        Expanded(
                                          flex: 3,
                                          child: Container(
                                            constraints: BoxConstraints.expand(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.15,
                                            ),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                              image: AssetImage(
                                                  ("assets/common/") +
                                                      boardPath),
                                              fit: BoxFit.cover,
                                            )),
                                            child: TextButton(
                                                child: null,
                                                onPressed: () {
                                                  Navigator.pushNamed(
                                                      context, '/boardStore');
                                                }),
                                          ),
                                        ),
                                        Expanded(flex: 1, child: SizedBox()),
                                      ]),
                                    ),
                                  ])
                                ],
                              ))
                        ]),
                  ),
                  Expanded(flex: 2, child: SizedBox()),
                  Expanded(
                    flex: 7,
                    child: new ElevatedButton(
                        child: Text(
                          "Guardar",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.055,
                              fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: purpleButton,
                          onPrimary: whiteWords,
                          minimumSize: Size(
                              MediaQuery.of(context).size.width * 0.8,
                              MediaQuery.of(context).size.height * 0.065),
                        ),
                        onPressed: () async {
                          if (_name.text != '') {
                            // ok name
                            if (await modifyData('name', _name.text)) {
                              await getData();
                              setState(() {});
                            } else {
                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (BuildContext context) => ErrorPopup(),
                              );
                            }
                          }
                          if (_pass1.text != '' && _pass2.text != '') {
                            // ok password
                            if (_pass1.text == _pass2.text) {
                              // same password
                              if (await modifyData('password', _pass1.text)) {
                                // Nothing, all good
                              } else {
                                showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (BuildContext context) =>
                                      ErrorPopup(),
                                );
                              }
                            } else {
                              // error, not same password
                              globalError =
                                  Error(error: 'Las contraseñas no coinciden');
                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (BuildContext context) => ErrorPopup(),
                              );
                            }
                          }
                          if (_name.text == '' &&
                              (_pass1.text == '' || _pass2.text == '')) {
                            // None parameters
                            if (_name.text == '' &&
                                _pass1.text == '' &&
                                _pass2.text == '') {
                              globalError = Error(
                                  error: 'No se ha introducido ningún cambio');
                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (BuildContext context) => ErrorPopup(),
                              );
                            } else if (_pass1.text == '' && _pass2.text != '') {
                              globalError = Error(
                                  error: 'Primer campo de la contraseña vacio');
                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (BuildContext context) => ErrorPopup(),
                              );
                            } else if (_pass1.text != '' && _pass2.text == '') {
                              globalError = Error(
                                  error:
                                      'Segundo campo de la contraseña vacio');
                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (BuildContext context) => ErrorPopup(),
                              );
                            } else {
                              globalError = Error(
                                  error:
                                      'Error inesperado, intentelo de nuevo');
                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (BuildContext context) => ErrorPopup(),
                              );
                            }
                          }
                          // Clean boxes
                          _name.text = '';
                          _pass1.text = '';
                          _pass2.text = '';
                          controllerStat.add(true);
                        }),
                  ),
                  Expanded(flex: 2, child: SizedBox()),
                  Expanded(
                    flex: 10,
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            new ElevatedButton(
                                child: Text(
                                  "Eliminar Cuenta",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.055,
                                      fontWeight: FontWeight.bold),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: whiteWords,
                                  onPrimary: redButton,
                                  side: BorderSide(color: redButton),
                                  minimumSize: Size(
                                      MediaQuery.of(context).size.width * 0.8,
                                      MediaQuery.of(context).size.height *
                                          0.065),
                                ),
                                onPressed: () {
                                  showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (BuildContext context) =>
                                        DeleteAccount(),
                                  );
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(flex: 2, child: SizedBox()),
                ],
              ),
            ),
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
    streamSubscription.cancel();
  }
}
