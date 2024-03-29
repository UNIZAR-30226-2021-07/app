import 'package:flutter/material.dart';
import 'package:gatovidapp/services/models.dart';

Widget classificationTable(BuildContext context) {
  Size screenSize = MediaQuery.of(context).size;
  double screenHeight = screenSize.height;
  //TODO: según como se reciba la info de backend poner las variables correspondientes en los parámetros
  if (clasificationNumerPlayers == 2) {
    return Container(
        child: Column(
      children: [
        Builder(
          builder: (BuildContext context) {
            if (clasificationGamers[0] != 'a') {
              return filaClasificadoaux(
                  context,
                  "assets/common/icons/medalla-oro.png",
                  clasificationGamers[0],
                  clasificationCoins[0].toString());
            } else {
              return Container();
            }
          },
        ),
        Container(child: SizedBox(height: screenHeight * 0.03)),
        Builder(
          builder: (BuildContext context) {
            if (clasificationGamers[1] != 'a') {
              return filaClasificadoaux(
                  context,
                  "assets/common/icons/medalla-plata.png",
                  clasificationGamers[1],
                  clasificationCoins[1].toString());
            } else {
              return Container();
            }
          },
        ),
      ],
    ));
  } else if (clasificationNumerPlayers == 3) {
    return Container(
        child: Column(
      children: [
        Builder(
          builder: (BuildContext context) {
            if (clasificationGamers[0] != 'a') {
              return filaClasificadoaux(
                  context,
                  "assets/common/icons/medalla-oro.png",
                  clasificationGamers[0],
                  clasificationCoins[0].toString());
            } else {
              return Container();
            }
          },
        ),
        Container(child: SizedBox(height: screenHeight * 0.03)),
        Builder(
          builder: (BuildContext context) {
            if (clasificationGamers[1] != 'a') {
              return filaClasificadoaux(
                  context,
                  "assets/common/icons/medalla-plata.png",
                  clasificationGamers[1],
                  clasificationCoins[1].toString());
            } else {
              return Container();
            }
          },
        ),
        Container(child: SizedBox(height: screenHeight * 0.03)),
        Builder(
          builder: (BuildContext context) {
            if (clasificationGamers[2] != 'a') {
              return filaClasificadoaux(
                  context,
                  "assets/common/icons/medalla-bronce.png",
                  clasificationGamers[2],
                  clasificationCoins[2].toString());
            } else {
              return Container();
            }
          },
        ),
      ],
    ));
  } else if (clasificationNumerPlayers == 4) {
    return Container(
        child: Column(
      children: [
        Builder(
          builder: (BuildContext context) {
            if (clasificationGamers[0] != 'a') {
              return filaClasificadoaux(
                  context,
                  "assets/common/icons/medalla-oro.png",
                  clasificationGamers[0],
                  clasificationCoins[0].toString());
            } else {
              return Container();
            }
          },
        ),
        Container(child: SizedBox(height: screenHeight * 0.03)),
        Builder(
          builder: (BuildContext context) {
            if (clasificationGamers[1] != 'a') {
              return filaClasificadoaux(
                  context,
                  "assets/common/icons/medalla-plata.png",
                  clasificationGamers[1],
                  clasificationCoins[1].toString());
            } else {
              return Container();
            }
          },
        ),
        Container(child: SizedBox(height: screenHeight * 0.03)),
        Builder(
          builder: (BuildContext context) {
            if (clasificationGamers[2] != 'a') {
              return filaClasificadoaux(
                  context,
                  "assets/common/icons/medalla-bronce.png",
                  clasificationGamers[2],
                  clasificationCoins[2].toString());
            } else {
              return Container();
            }
          },
        ),
        Container(child: SizedBox(height: screenHeight * 0.03)),
        Builder(
          builder: (BuildContext context) {
            if (clasificationGamers[3] != 'a') {
              return filaClasificadoaux(
                  context,
                  "assets/common/icons/diploma.png",
                  clasificationGamers[3],
                  clasificationCoins[3].toString());
            } else {
              return Container();
            }
          },
        ),
      ],
    ));
  } else if (clasificationNumerPlayers == 5) {
    return Container(
        child: Column(
      children: [
        Builder(
          builder: (BuildContext context) {
            if (clasificationGamers[0] != 'a') {
              return filaClasificadoaux(
                  context,
                  "assets/common/icons/medalla-oro.png",
                  clasificationGamers[0],
                  clasificationCoins[0].toString());
            } else {
              return Container();
            }
          },
        ),
        Container(child: SizedBox(height: screenHeight * 0.03)),
        Builder(
          builder: (BuildContext context) {
            if (clasificationGamers[1] != 'a') {
              return filaClasificadoaux(
                  context,
                  "assets/common/icons/medalla-plata.png",
                  clasificationGamers[1],
                  clasificationCoins[1].toString());
            } else {
              return Container();
            }
          },
        ),
        Container(child: SizedBox(height: screenHeight * 0.03)),
        Builder(
          builder: (BuildContext context) {
            if (clasificationGamers[2] != 'a') {
              return filaClasificadoaux(
                  context,
                  "assets/common/icons/medalla-bronce.png",
                  clasificationGamers[2],
                  clasificationCoins[2].toString());
            } else {
              return Container();
            }
          },
        ),
        Container(child: SizedBox(height: screenHeight * 0.03)),
        Builder(
          builder: (BuildContext context) {
            if (clasificationGamers[3] != 'a') {
              return filaClasificadoaux(
                  context,
                  "assets/common/icons/diploma.png",
                  clasificationGamers[3],
                  clasificationCoins[3].toString());
            } else {
              return Container();
            }
          },
        ),
        Container(child: SizedBox(height: screenHeight * 0.03)),
        Builder(
          builder: (BuildContext context) {
            if (clasificationGamers[4] != 'a') {
              return filaClasificadoaux(
                  context,
                  "assets/common/icons/diploma.png",
                  clasificationGamers[4],
                  clasificationCoins[4].toString());
            } else {
              return Container();
            }
          },
        ),
      ],
    ));
  } else if (clasificationNumerPlayers == 6) {
    return Container(
        child: Column(
      children: [
        Builder(
          builder: (BuildContext context) {
            if (clasificationGamers[0] != 'a') {
              return filaClasificadoaux(
                  context,
                  "assets/common/icons/medalla-oro.png",
                  clasificationGamers[0],
                  clasificationCoins[0].toString());
            } else {
              return Container();
            }
          },
        ),
        Container(child: SizedBox(height: screenHeight * 0.03)),
        Builder(
          builder: (BuildContext context) {
            if (clasificationGamers[1] != 'a') {
              return filaClasificadoaux(
                  context,
                  "assets/common/icons/medalla-plata.png",
                  clasificationGamers[1],
                  clasificationCoins[1].toString());
            } else {
              return Container();
            }
          },
        ),
        Container(child: SizedBox(height: screenHeight * 0.03)),
        Builder(
          builder: (BuildContext context) {
            if (clasificationGamers[2] != 'a') {
              return filaClasificadoaux(
                  context,
                  "assets/common/icons/medalla-bronce.png",
                  clasificationGamers[2],
                  clasificationCoins[2].toString());
            } else {
              return Container();
            }
          },
        ),
        Container(child: SizedBox(height: screenHeight * 0.03)),
        Builder(
          builder: (BuildContext context) {
            if (clasificationGamers[3] != 'a') {
              return filaClasificadoaux(
                  context,
                  "assets/common/icons/diploma.png",
                  clasificationGamers[3],
                  clasificationCoins[3].toString());
            } else {
              return Container();
            }
          },
        ),
        Container(child: SizedBox(height: screenHeight * 0.03)),
        Builder(
          builder: (BuildContext context) {
            if (clasificationGamers[4] != 'a') {
              return filaClasificadoaux(
                  context,
                  "assets/common/icons/diploma.png",
                  clasificationGamers[4],
                  clasificationCoins[4].toString());
            } else {
              return Container();
            }
          },
        ),
        Container(child: SizedBox(height: screenHeight * 0.03)),
        Builder(
          builder: (BuildContext context) {
            if (clasificationGamers[5] != 'a') {
              return filaClasificadoaux(
                  context,
                  "assets/common/icons/diploma.png",
                  clasificationGamers[5],
                  clasificationCoins[5].toString());
            } else {
              return Container();
            }
          },
        ),
      ],
    ));
  }
  return Container();
}

Widget filaClasificadoaux(
    BuildContext context, String imagePosition, String gamer, String money) {
  Size screenSize = MediaQuery.of(context).size;
  double screenHeight = screenSize.height;
  double screenWidth = screenSize.width;
  return Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
    SizedBox(
        width: screenWidth,
        child: Row(children: [
          Expanded(child: SizedBox()),
          Expanded(child: Image(image: AssetImage(imagePosition))),
          Expanded(child: SizedBox()),
          Expanded(
              flex: 4,
              //TODO: variable jugador
              child: Text(gamer, style: TextStyle(fontSize: 20.0))),
          Expanded(child: SizedBox()),
          Expanded(
              //TODO: variable puntuacion
              child: Text(money,
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold))),
          Expanded(
            child: Icon(Icons.pets,
                size: screenHeight * 0.03, color: Colors.amber),
          ),
          Expanded(child: SizedBox())
        ])),
  ]);
}
