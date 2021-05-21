import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gatovidapp/services/models.dart';
import 'package:gatovidapp/partidas/hand.dart';
import 'package:gatovidapp/partidas/body.dart';

Widget playBox(BuildContext context) {
  return Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
    Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.13,
      child: Body(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.13,
        listOrgans: bodyOfPlayer,
        name: globalData.name,
      ),
    ),
    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
    Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.14,
      child: HandTemplate(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.14,
      ),
    ),
    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
  ]);
}

Widget winnerBox(BuildContext context) {
  Size screenSize = MediaQuery.of(context).size;
  double screenHeight = screenSize.height;
  double screenWidth = screenSize.width;
  return Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
    Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.27,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text(
              "!Has terminado!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width * 0.1),
            )),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Center(
              child: Container(
                width: screenWidth * 0.3,
                height: screenHeight * 0.15,
                child: Image(
                    image: AssetImage(
                        "assets/common/icons/fuegos-artificiales.png")),
              ),
            )
          ],
        )),
    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
  ]);
}
