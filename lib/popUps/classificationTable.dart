import 'package:flutter/material.dart';
import 'package:gatovidapp/services/models.dart';

Widget classificationTable(BuildContext context) {
  Size screenSize = MediaQuery.of(context).size;
  double screenHeight = screenSize.height;
  //TODO: según como se reciba la info de backend poner las variables correspondientes en los parámetros
  if (clasificationGamers.length == 2) {
    return Container(
        child: Column(
      children: [
        filaClasificadoaux(context, "assets/common/icons/medalla-oro.png",
            clasificationGamers[0], clasificationCoins[0].toString()),
        Container(child: SizedBox(height: screenHeight * 0.03)),
        filaClasificadoaux(context, "assets/common/icons/medalla-plata.png",
            clasificationGamers[1], clasificationCoins[1].toString()),
      ],
    ));
  } else if (clasificationGamers.length == 3) {
    return Container(
        child: Column(
      children: [
        filaClasificadoaux(context, "assets/common/icons/medalla-oro.png",
            clasificationGamers[0], clasificationCoins[0].toString()),
        Container(child: SizedBox(height: screenHeight * 0.03)),
        filaClasificadoaux(context, "assets/common/icons/medalla-plata.png",
            clasificationGamers[1], clasificationCoins[1].toString()),
        Container(child: SizedBox(height: screenHeight * 0.03)),
        filaClasificadoaux(context, "assets/common/icons/medalla-bronce.png",
            clasificationGamers[2], clasificationCoins[2].toString()),
      ],
    ));
  } else if (clasificationGamers.length == 4) {
    return Container(
        child: Column(
      children: [
        filaClasificadoaux(context, "assets/common/icons/medalla-oro.png",
            clasificationGamers[0], clasificationCoins[0].toString()),
        Container(child: SizedBox(height: screenHeight * 0.03)),
        filaClasificadoaux(context, "assets/common/icons/medalla-plata.png",
            clasificationGamers[1], clasificationCoins[1].toString()),
        Container(child: SizedBox(height: screenHeight * 0.03)),
        filaClasificadoaux(context, "assets/common/icons/medalla-bronce.png",
            clasificationGamers[2], clasificationCoins[2].toString()),
        Container(child: SizedBox(height: screenHeight * 0.03)),
        filaClasificadoaux(context, "assets/common/icons/diploma.png",
            clasificationGamers[3], clasificationCoins[3].toString()),
      ],
    ));
  } else if (clasificationGamers.length == 5) {
    return Container(
        child: Column(
      children: [
        filaClasificadoaux(context, "assets/common/icons/medalla-oro.png",
            clasificationGamers[0], clasificationCoins[0].toString()),
        Container(child: SizedBox(height: screenHeight * 0.03)),
        filaClasificadoaux(context, "assets/common/icons/medalla-plata.png",
            clasificationGamers[1], clasificationCoins[1].toString()),
        Container(child: SizedBox(height: screenHeight * 0.03)),
        filaClasificadoaux(context, "assets/common/icons/medalla-bronce.png",
            clasificationGamers[2], clasificationCoins[2].toString()),
        Container(child: SizedBox(height: screenHeight * 0.03)),
        filaClasificadoaux(context, "assets/common/icons/diploma.png",
            clasificationGamers[3], clasificationCoins[3].toString()),
        Container(child: SizedBox(height: screenHeight * 0.03)),
        filaClasificadoaux(context, "assets/common/icons/diploma.png",
            clasificationGamers[4], clasificationCoins[4].toString()),
      ],
    ));
  } else if (clasificationGamers.length == 6) {
    return Container(
        child: Column(
      children: [
        filaClasificadoaux(context, "assets/common/icons/medalla-oro.png",
            clasificationGamers[0], clasificationCoins[0].toString()),
        Container(child: SizedBox(height: screenHeight * 0.03)),
        filaClasificadoaux(context, "assets/common/icons/medalla-plata.png",
            clasificationGamers[1], clasificationCoins[1].toString()),
        Container(child: SizedBox(height: screenHeight * 0.03)),
        filaClasificadoaux(context, "assets/common/icons/medalla-bronce.png",
            clasificationGamers[2], clasificationCoins[2].toString()),
        Container(child: SizedBox(height: screenHeight * 0.03)),
        filaClasificadoaux(context, "assets/common/icons/diploma.png",
            clasificationGamers[3], clasificationCoins[3].toString()),
        Container(child: SizedBox(height: screenHeight * 0.03)),
        filaClasificadoaux(context, "assets/common/icons/diploma.png",
            clasificationGamers[4], clasificationCoins[4].toString()),
        Container(child: SizedBox(height: screenHeight * 0.03)),
        filaClasificadoaux(context, "assets/common/icons/diploma.png",
            clasificationGamers[5], clasificationCoins[5].toString()),
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
