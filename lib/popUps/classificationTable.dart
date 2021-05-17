import 'package:flutter/material.dart';
import 'package:gatovidapp/services/models.dart';

Widget classificationTable(BuildContext context) {
  Size screenSize = MediaQuery.of(context).size;
  double screenHeight = screenSize.height;
  //TODO: según como se reciba la info de backend poner las variables correspondientes en los parámetros
  if (numGamers == 2) {
    return Container(
        child: Column(
      children: [
        filaClasificadoaux(
            context, "assets/common/icons/medalla-oro.png", "Jugador 1", "50"),
        Container(child: SizedBox(height: screenHeight * 0.03)),
        filaClasificadoaux(context, "assets/common/icons/medalla-plata.png",
            "Jugador 2", "50"),
      ],
    ));
  } else if (numGamers == 3) {
    return Container(
        child: Column(
      children: [
        filaClasificadoaux(
            context, "assets/common/icons/medalla-oro.png", "Jugador 1", "50"),
        Container(child: SizedBox(height: screenHeight * 0.03)),
        filaClasificadoaux(context, "assets/common/icons/medalla-plata.png",
            "Jugador 2", "50"),
        Container(child: SizedBox(height: screenHeight * 0.03)),
        filaClasificadoaux(context, "assets/common/icons/medalla-bronce.png",
            "Jugador 3", "50"),
      ],
    ));
  } else if (numGamers == 4) {
    return Container(
        child: Column(
      children: [
        filaClasificadoaux(
            context, "assets/common/icons/medalla-oro.png", "Jugador 1", "50"),
        Container(child: SizedBox(height: screenHeight * 0.03)),
        filaClasificadoaux(context, "assets/common/icons/medalla-plata.png",
            "Jugador 2", "50"),
        Container(child: SizedBox(height: screenHeight * 0.03)),
        filaClasificadoaux(context, "assets/common/icons/medalla-bronce.png",
            "Jugador 3", "50"),
        Container(child: SizedBox(height: screenHeight * 0.03)),
        filaClasificadoaux(
            context, "assets/common/icons/diploma.png", "Jugador 4", "50"),
      ],
    ));
  } else if (numGamers == 5) {
    return Container(
        child: Column(
      children: [
        filaClasificadoaux(
            context, "assets/common/icons/medalla-oro.png", "Jugador 1", "50"),
        Container(child: SizedBox(height: screenHeight * 0.03)),
        filaClasificadoaux(context, "assets/common/icons/medalla-plata.png",
            "Jugador 2", "50"),
        Container(child: SizedBox(height: screenHeight * 0.03)),
        filaClasificadoaux(context, "assets/common/icons/medalla-bronce.png",
            "Jugador 3", "50"),
        Container(child: SizedBox(height: screenHeight * 0.03)),
        filaClasificadoaux(
            context, "assets/common/icons/diploma.png", "Jugador 4", "50"),
        Container(child: SizedBox(height: screenHeight * 0.03)),
        filaClasificadoaux(
            context, "assets/common/icons/diploma.png", "Jugador 5", "50"),
      ],
    ));
  } else if (numGamers == 6) {
    return Container(
        child: Column(
      children: [
        filaClasificadoaux(
            context, "assets/common/icons/medalla-oro.png", "Jugador 1", "50"),
        Container(child: SizedBox(height: screenHeight * 0.03)),
        filaClasificadoaux(context, "assets/common/icons/medalla-plata.png",
            "Jugador 2", "50"),
        Container(child: SizedBox(height: screenHeight * 0.03)),
        filaClasificadoaux(context, "assets/common/icons/medalla-bronce.png",
            "Jugador 3", "50"),
        Container(child: SizedBox(height: screenHeight * 0.03)),
        filaClasificadoaux(
            context, "assets/common/icons/diploma.png", "Jugador 4", "50"),
        Container(child: SizedBox(height: screenHeight * 0.03)),
        filaClasificadoaux(
            context, "assets/common/icons/diploma.png", "Jugador 5", "50"),
        Container(child: SizedBox(height: screenHeight * 0.03)),
        filaClasificadoaux(
            context, "assets/common/icons/diploma.png", "Jugador 6", "50"),
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
