import 'package:flutter/material.dart';
import 'package:gatovidapp/partidas/playerBox.dart';
import 'package:gatovidapp/services/models.dart';

Widget PlayersTable(BuildContext context) {
  return Container(
    //TODO: resto de casos
    //Caso 6 jugadores -> 5 oponentes
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: MediaQuery.of(context).size.width * 0.02),
            PlayerBox(
              width: MediaQuery.of(context).size.width * 0.45,
              height: MediaQuery.of(context).size.height * 0.15,
              playerImage:
                  ("assets/common/") + picsList[globalData.picture]['image'],
              playerName: globalData.name,
              //TODO: la lista con la info del servidor
              listOrgansplayer: [
                [1, 6, 5],
                [7, 6],
                [4],
                [4]
              ],
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.02),
            PlayerBox(
              width: MediaQuery.of(context).size.width * 0.45,
              height: MediaQuery.of(context).size.height * 0.15,
              playerImage:
                  ("assets/common/") + picsList[globalData.picture]['image'],
              playerName: globalData.name,
              //TODO: la lista con la info del servidor
              listOrgansplayer: [
                [1, 6, 5],
                [7, 6],
                [4],
                [4]
              ],
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.02),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: MediaQuery.of(context).size.width * 0.02),
            PlayerBox(
              width: MediaQuery.of(context).size.width * 0.45,
              height: MediaQuery.of(context).size.height * 0.15,
              playerImage:
                  ("assets/common/") + picsList[globalData.picture]['image'],
              playerName: globalData.name,
              //TODO: la lista con la info del servidor
              listOrgansplayer: [
                [1, 6, 5],
                [7, 6],
                [4],
                [4]
              ],
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.02),
            PlayerBox(
              width: MediaQuery.of(context).size.width * 0.45,
              height: MediaQuery.of(context).size.height * 0.15,
              playerImage:
                  ("assets/common/") + picsList[globalData.picture]['image'],
              playerName: globalData.name,
              //TODO: la lista con la info del servidor
              listOrgansplayer: [
                [1, 6, 5],
                [7, 6],
                [4],
                [4]
              ],
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.02),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PlayerBox(
              width: MediaQuery.of(context).size.width * 0.45,
              height: MediaQuery.of(context).size.height * 0.15,
              playerImage:
                  ("assets/common/") + picsList[globalData.picture]['image'],
              playerName: globalData.name,
              //TODO: la lista con la info del servidor
              listOrgansplayer: [
                [1, 6, 5],
                [7, 6],
                [4],
                [4]
              ],
            )
          ],
        ),
      ],
    ),
  );
}
