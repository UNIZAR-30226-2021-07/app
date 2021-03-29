import 'package:flutter/material.dart';
import 'package:gatovidapp/perfil/profileConf.dart';
import 'package:gatovidapp/chat/chat.dart';

class ProfilePage extends StatefulWidget {
  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<ProfilePage>
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
        backgroundColor: Colors.lightGreenAccent,
        title: const Text(
          'Mi perfil',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
              color: Colors.black),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded),
            color: Colors.black,
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
        child: new Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
                  child: new Row(
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
                    )),
                Padding(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.025),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            new ElevatedButton(
                                child: const Text(
                                  "Editar Perfil",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.grey,
                                  onPrimary: Colors.white,
                                  minimumSize: Size(MediaQuery.of(context).size.width * 0.4, MediaQuery.of(context).size.height * 0.05),
                                ),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileConf()));
                                }),
                          ],
                        ),
                      ],
                    )),
                Padding(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Text(
                              'Estadísticas',
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height * 0.032,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    )),
                Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width *0.1,
                        right: MediaQuery.of(context).size.width *0.1,
                        top: MediaQuery.of(context).size.height * 0.02
                    ),
                    child: new Table(
                      children: [ TableRow(
                        children: <Widget>[
                          Text('Partidas jugadas:',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height * 0.025,
                                  fontWeight: FontWeight.bold
                              )
                          ),
                          Text('354',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontSize: MediaQuery.of(context).size.height * 0.025,
                                fontWeight: FontWeight.normal
                            )
                        ),
                      ]
                    )]
                  )
                ),
                Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width *0.1,
                        right: MediaQuery.of(context).size.width *0.1,
                        top: MediaQuery.of(context).size.height * 0.025
                    ),
                    child: new Table(
                        children: [ TableRow(
                            children: <Widget>[
                              Text('Partidas ganadas:',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: MediaQuery.of(context).size.height * 0.025,
                                      fontWeight: FontWeight.bold
                                  )
                              ),
                              Text('350',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontSize: MediaQuery.of(context).size.height * 0.025,
                                      fontWeight: FontWeight.normal
                                  )
                              ),
                            ]
                        )]
                    )
                ),
                Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width *0.1,
                        right: MediaQuery.of(context).size.width *0.1,
                        top: MediaQuery.of(context).size.height * 0.025
                    ),
                    child: new Table(
                        children: [ TableRow(
                            children: <Widget>[
                              Text('Tiempo jugado:',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: MediaQuery.of(context).size.height * 0.025,
                                      fontWeight: FontWeight.bold
                                  )
                              ),
                              Text('3h 54',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontSize: MediaQuery.of(context).size.height * 0.025,
                                      fontWeight: FontWeight.normal
                                  )
                              ),
                            ]
                        )]
                    )
                ),
                Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width *0.1,
                        right: MediaQuery.of(context).size.width *0.1,
                        top: MediaQuery.of(context).size.height * 0.025
                    ),
                    child: new Table(
                        children: [ TableRow(
                            children: <Widget>[
                              Text('Partidas perdidas:',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: MediaQuery.of(context).size.height * 0.025,
                                      fontWeight: FontWeight.bold
                                  )
                              ),
                              Text('4',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontSize: MediaQuery.of(context).size.height * 0.025,
                                      fontWeight: FontWeight.normal
                                  )
                              ),
                            ]
                        )]
                    )
                ),
                Padding(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            new ElevatedButton(
                                child: const Text(
                                  "Cerrar sesión",
                                  style: TextStyle(
                                      fontSize: 20.0, fontWeight: FontWeight.bold),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red[600],
                                  onPrimary: Colors.white,
                                  minimumSize: Size(MediaQuery.of(context).size.width * 0.6, MediaQuery.of(context).size.height * 0.065),
                                ),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen()));
                                  // TODO: Log-out
                                }),
                          ],
                        ),
                      ],
                    )),
              ],
            ),
        )
    );
  }
}
