import 'package:flutter/material.dart';

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
        backgroundColor: Colors.lightGreenAccent,
        title: const Text(
          'Configuración',
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
                                    backgroundColor: Colors.purple,
                                    radius: MediaQuery.of(context).size.height * 0.03,
                                    child: new Icon(
                                      Icons.camera_alt,
                                      color: Colors.white,
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
                            fillColor: Colors.white,
                            filled: true
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
                            fillColor: Colors.white,
                            filled: true
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
                        top: MediaQuery.of(context).size.height * 0.023
                    ),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            new ElevatedButton(
                                child: const Text(
                                  "Cambiar tablero",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blueAccent,
                                  onPrimary: Colors.white,
                                  minimumSize: Size(MediaQuery.of(context).size.width * 0.8, MediaQuery.of(context).size.height * 0.065),
                                ),
                                onPressed: () {
                                  // TODO: Change table
                                }
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
                                  primary: Colors.purple,
                                  onPrimary: Colors.white,
                                  minimumSize: Size(MediaQuery.of(context).size.width * 0.8, MediaQuery.of(context).size.height * 0.065),
                                ),
                                onPressed: () {
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
                                    primary: Colors.white,
                                    onPrimary: Colors.red,
                                    side: BorderSide(color: Colors.red),
                                    minimumSize: Size(MediaQuery.of(context).size.width * 0.8, MediaQuery.of(context).size.height * 0.065),
                                  ),
                                  onPressed: () {
                                    // TODO: Delete account
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
