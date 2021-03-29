import 'package:flutter/material.dart';
import 'package:gatovidapp/popUps/deleteAccount.dart';
import 'package:gatovidapp/popUps/loadingGame.dart';
import 'package:gatovidapp/popUps/startGame.dart';
// Colors to use

Color greenAppBar = Color(0xff64DD17);
Color blackWords = Color(0xff000000);
Color greyWords = Color(0xff717171);
Color purpleButton = Color(0xff6A1B9A);
Color purpleCamera = Color(0xff9C4DCC);
Color whiteWords = Color(0xffffffff);
Color redButton = Color(0xffFF0000);

class ProfileConf extends StatefulWidget {
  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<ProfileConf>
    with SingleTickerProviderStateMixin {
  final FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: MediaQuery.of(context).size.height * 0.075,
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
              colorFilter: new ColorFilter.mode(Colors.white.withOpacity(0.05), BlendMode.dstATop),
              image: AssetImage("assets/images/bg.png"),
              fit: BoxFit.cover,
            )
        ),
          child: SingleChildScrollView(
              child: new Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
                    child: new Stack(
                      fit: StackFit.loose,
                      children: <Widget>[
                        new Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: MediaQuery.of(context).size.height * 0.2,
                                decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: new DecorationImage(
                                    image: new ExactAssetImage(
                                        'assets/images/defaultProfile.png'),
                                  ),
                                )),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.003, left: MediaQuery.of(context).size.width * 0.5),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                                FlatButton(
                                  child: new CircleAvatar(
                                    backgroundColor: purpleCamera,
                                    radius: MediaQuery.of(context).size.height * 0.03,
                                    child: new Icon(
                                      Icons.camera_alt,
                                      color: whiteWords,
                                      size: MediaQuery.of(context).size.height * 0.03,
                                    )
                                  ),
                                  onPressed: () {
                                  },
                                ),
                            ],
                          )
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.02),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              new Text('Juan Carlos',
                                  style: TextStyle(
                                      fontSize: MediaQuery.of(context).size.height * 0.025,
                                      fontWeight: FontWeight.bold)),
                              new Text(
                                'juancarlos@gmail.com',
                                style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.height * 0.025,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ],
                      )
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width *0.1,
                        right: MediaQuery.of(context).size.width *0.1,
                        top: MediaQuery.of(context).size.height * 0.023
                    ),
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tight(Size(MediaQuery.of(context).size.width * 0.8, MediaQuery.of(context).size.height * 0.06)),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(width: 1.0)),
                            hintText: 'Cambiar nombre',
                            isDense: true,
                            fillColor: whiteWords,
                            filled: true
                        ),
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.022,
                          fontWeight: FontWeight.normal,
                          color: greyWords,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width *0.1,
                        right: MediaQuery.of(context).size.width *0.1,
                        top: MediaQuery.of(context).size.height * 0.023
                    ),
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tight(Size(MediaQuery.of(context).size.width * 0.8, MediaQuery.of(context).size.height * 0.06)),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(width: 1.0)),
                            hintText: 'Cambiar contraseña',
                            isDense: true,
                            fillColor: whiteWords,
                            filled: true
                        ),
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.022,
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
                  Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width *0.1,
                        right: MediaQuery.of(context).size.width *0.1,
                        top: MediaQuery.of(context).size.height * 0.025
                    ),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Container(
                          constraints: BoxConstraints.tight(Size(MediaQuery.of(context).size.width * 0.8, MediaQuery.of(context).size.width * 0.15)),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black45), // No se que color es, Leti no me lo tengas en cuenta
                            borderRadius: BorderRadius.circular(8.0),
                            color: whiteWords,  //add it here
                          ),
                          child: new Table(
                            children: [ TableRow(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width *0.027,
                                      right: MediaQuery.of(context).size.width *0.027,
                                      top: MediaQuery.of(context).size.height *0.021,
                                      bottom: MediaQuery.of(context).size.height *0.021
                                  ),
                                  child: Text('Cambiar Tablero',
                                    textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context).size.height * 0.022,
                                          fontWeight: FontWeight.normal,
                                          color: greyWords,
                                      ),
                                  )
                                ),
                                Padding(
                                  padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width *0.05,
                                        right: MediaQuery.of(context).size.width *0.05,
                                    ),
                                    child: new ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: greenAppBar,
                                          minimumSize: Size(MediaQuery.of(context).size.width * 0.005, MediaQuery.of(context).size.height * 0.05),
                                        ),
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) => StartGame(),
                                          );
                                          // TODO: Change table
                                        }
                                    ),
                                  )
                                ),
                              ]
                            )],
                          )
                        )
                      ]
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width *0.1,
                        right: MediaQuery.of(context).size.width *0.1,
                        top: MediaQuery.of(context).size.height * 0.023
                    ),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            new ElevatedButton(
                                child: const Text(
                                  "Guardar",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: purpleButton,
                                  onPrimary: whiteWords,
                                  minimumSize: Size(MediaQuery.of(context).size.width * 0.8, MediaQuery.of(context).size.height * 0.065),
                                ),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) => LoadingGame(),
                                  );
                                  // TODO: Save changes
                                }),
                          ],
                        ),
                      ],
                    )
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width *0.1,
                          right: MediaQuery.of(context).size.width *0.1,
                          top: MediaQuery.of(context).size.height * 0.023
                      ),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              new ElevatedButton(
                                  child: const Text(
                                    "Eliminar Cuenta",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: whiteWords,
                                    onPrimary: redButton,
                                    side: BorderSide(color: redButton),
                                    minimumSize: Size(MediaQuery.of(context).size.width * 0.8, MediaQuery.of(context).size.height * 0.065),
                                  ),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) => DeleteAccount(),
                                    );
                                  }),
                            ],
                          ),
                        ],
                      )
                  ),
                ],
              ),
            ),
          ),
        );
  }
}
