import 'package:flutter/material.dart';
import 'package:gatovidapp/partidas/playerBox.dart';
import 'package:gatovidapp/services/models.dart';

int numJugadoresPrueba = 2;

Widget PlayersTable(BuildContext context) {

  if (numJugadoresPrueba == 6) {
    return Container(
      //TODO: resto de casos
      //Caso 6 jugadores -> 5 oponentes
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.02),
              PlayerBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.45,
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.15,
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
              SizedBox(width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.02),
              PlayerBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.45,
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.15,
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
              SizedBox(width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.02),
            ],
          ),
          SizedBox(height: MediaQuery
              .of(context)
              .size
              .height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.02),
              PlayerBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.45,
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.15,
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
              SizedBox(width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.02),
              PlayerBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.45,
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.15,
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
              SizedBox(width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.02),
            ],
          ),
          SizedBox(height: MediaQuery
              .of(context)
              .size
              .height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PlayerBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.45,
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.15,
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
  if (numJugadoresPrueba == 5) {
    return Container(
      //TODO: resto de casos
      //Caso 6 jugadores -> 4 oponentes
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.02),
              PlayerBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.45,
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.15,
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
              SizedBox(width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.02),
              PlayerBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.45,
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.15,
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
              SizedBox(width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.02),
            ],
          ),
          SizedBox(height: MediaQuery
              .of(context)
              .size
              .height * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.02),
              PlayerBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.45,
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.15,
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
              SizedBox(width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.02),
              PlayerBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.45,
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.15,
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
              SizedBox(width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.02),
            ],
          ),
        ],
      ),
    );
  }
  if (numJugadoresPrueba == 4) {
    return Container(
      //TODO: resto de casos
      //Caso 6 jugadores -> 3 oponentes
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.02),
              PlayerBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.45,
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.15,
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
              SizedBox(width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.02),
              PlayerBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.45,
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.15,
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
              SizedBox(width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.02),
            ],
          ),
          SizedBox(height: MediaQuery
              .of(context)
              .size
              .height * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PlayerBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.8,
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.25,
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
            ],
          ),
        ],
      ),
    );
  }
  if (numJugadoresPrueba == 3) {
    return Container(
      //TODO: resto de casos
      //Caso 6 jugadores -> 2 oponentes
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PlayerBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.8,
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.23,
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
          SizedBox(height: MediaQuery
              .of(context)
              .size
              .height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PlayerBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.8,
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.23,
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
  if (numJugadoresPrueba == 2) {
    Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PlayerBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.9,
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.3,
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
            ],
          ),
        ],
      ),
    );
  }
  if (numJugadoresPrueba < 2 || numJugadoresPrueba > 6) {
    print('Numero de jugadores incorrecto:' + numJugadoresPrueba.toString());
    return Container(
      width: 0.0,
      height: 0.0,
    );
  }
}
