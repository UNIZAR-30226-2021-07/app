import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  bool _status = true;
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
          backgroundColor: Colors.lightGreenAccent,
          title: const Text('Mi perfil',
            style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 30.0,
                color: Colors.black
            ),
          ),
          leading: IconButton(
              icon: Icon(Icons.arrow_back_rounded),
              color: Colors.black,
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: new Container(
          color: Colors.white,
            child: new Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                          width: 140.0,
                          height: 140.0,
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                              image: new ExactAssetImage(
                                  'assets/images/defaultProfile.png'),
                            ),
                          )
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        left: 25.0, right: 25.0, top: 25.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            new Text(
                                'Juan Carlos',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold)
                            ),
                            new Text(
                              'juancarlos@gmail.com',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.normal
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
                Padding(
                    padding: EdgeInsets.only(
                        left: 25.0, right: 25.0, top: 25.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            new ElevatedButton(
                                child: const Text("Editar Perfil",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.normal),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.grey,
                                  onPrimary: Colors.white,
                                  minimumSize: Size(15.0, 35.0),
                                ),
                                onPressed: () {
                                  // TODO: Navegate to edit profile screen
                                }),
                          ],
                        ),
                      ],
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Text(
                              'Estadísticas',
                              style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    )),
                Padding(
                    padding: EdgeInsets.only(
                        left: 30.0, right: 30, top: 25.0),
                    child: new Row(
                      children: <Widget>[
                        new Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              new Text('Partidas Jugadas:',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]
                        ),
                        new Column(
                            mainAxisAlignment: MainAxisAlignment
                                .start,
                            children: <Widget>[
                              new Text('354',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.normal),
                              ),
                            ]
                        ),
                      ],
                    )
                ),
                Padding(
                    padding: EdgeInsets.only(
                        left: 30.0, right: 30, top: 25.0),
                    child: new Row(
                      children: <Widget>[
                        new Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              new Text('Partidas ganadas:',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]
                        ),
                        new Column(
                            mainAxisAlignment: MainAxisAlignment
                                .start,
                            children: <Widget>[
                              new Text('350',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.normal),
                              ),
                            ]
                        ),
                      ],
                    )
                ),
                Padding(
                    padding: EdgeInsets.only(
                        left: 30.0, right: 30, top: 25.0),
                    child: new Row(
                      children: <Widget>[
                        new Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              new Text('Tiempo jugado:',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]
                        ),
                        new Column(
                            mainAxisAlignment: MainAxisAlignment
                                .start,
                            children: <Widget>[
                              new Text('3h 54',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.normal),
                              ),
                            ]
                        ),
                      ],
                    )
                ),
                Padding(
                    padding: EdgeInsets.only(
                        left: 30.0, right: 30, top: 25.0),
                    child: new Row(
                      children: <Widget>[
                        new Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              new Text('Partidas perdidas:',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]
                        ),
                        new Column(
                            mainAxisAlignment: MainAxisAlignment
                                .start,
                            children: <Widget>[
                              new Text('4',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.normal),
                              ),
                            ]
                        ),
                      ],
                    )
                ),
                Padding(
                    padding: EdgeInsets.only(
                        left: 25.0, right: 25.0, top: 25.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            new ElevatedButton(
                                child: const Text("Cerrar sesión",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red[600],
                                  onPrimary: Colors.white,
                                  minimumSize: Size(300.0, 50.0),
                                ),
                                onPressed: () {
                                  // TODO: Log-out
                                }),
                          ],
                        ),
                      ],
                    )
                ),
              ],
            ),
          ),
        );
  }
}