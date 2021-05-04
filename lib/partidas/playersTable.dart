import 'package:flutter/material.dart';
import 'package:gatovidapp/partidas/playerBox.dart';
import 'package:gatovidapp/services/models.dart';

class PlayersTableTemplate extends StatelessWidget {
  const PlayersTableTemplate({
    this.width,
    this.height,
  });

  final width;
  final height;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: (() {
      if (listOfGamers.length == 5) {
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: this.width * 0.02),
                  Container(
                    width: this.width * 0.45,
                    height: this.height * 0.32,
                    child: TextButton(
                        child: PlayerBox(
                          width: this.width * 0.4,
                          height: this.height * 0.25,
                          playerImage: ("assets/common/") +
                              picsList[listOfGamers[4].pictureId]['image'],
                          playerName: listOfGamers[4].name,
                          //TODO: la lista con la info del servidor
                          listOrgansplayer: listOfGamers[4].bodyList,
                        ),
                        onPressed: () {
                          expansion = 5;
                          controlGame.add(true);
                          print(expansion.toString());
                        }),
                  ),
                  SizedBox(width: this.width * 0.02),
                  Container(
                    width: this.width * 0.45,
                    height: this.height * 0.32,
                    child: TextButton(
                        child: PlayerBox(
                          width: this.width * 0.4,
                          height: this.height * 0.25,
                          playerImage: ("assets/common/") +
                              picsList[listOfGamers[3].pictureId]['image'],
                          playerName: listOfGamers[3].name,
                          //TODO: la lista con la info del servidor
                          listOrgansplayer: listOfGamers[3].bodyList,
                        ),
                        onPressed: () {
                          expansion = 4;
                          controlGame.add(true);
                          print(expansion.toString());
                        }),
                  ),
                  SizedBox(width: this.width * 0.02),
                ],
              ),
              SizedBox(height: this.height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: this.width * 0.02),
                  Container(
                    width: this.width * 0.45,
                    height: this.height * 0.32,
                    child: TextButton(
                        child: PlayerBox(
                          width: this.width * 0.4,
                          height: this.height * 0.25,
                          playerImage: ("assets/common/") +
                              picsList[listOfGamers[2].pictureId]['image'],
                          playerName: listOfGamers[2].name,
                          //TODO: la lista con la info del servidor
                          listOrgansplayer: listOfGamers[2].bodyList,
                        ),
                        onPressed: () {
                          expansion = 3;
                          controlGame.add(true);
                          print(expansion.toString());
                        }),
                  ),
                  SizedBox(width: this.width * 0.02),
                  Container(
                    width: this.width * 0.45,
                    height: this.height * 0.32,
                    child: TextButton(
                        child: PlayerBox(
                          width: this.width * 0.4,
                          height: this.height * 0.25,
                          playerImage: ("assets/common/") +
                              picsList[listOfGamers[1].pictureId]['image'],
                          playerName: listOfGamers[1].name,
                          //TODO: la lista con la info del servidor
                          listOrgansplayer: listOfGamers[1].bodyList,
                        ),
                        onPressed: () {
                          expansion = 2;
                          controlGame.add(true);
                          print(expansion.toString());
                        }),
                  ),
                  SizedBox(width: this.width * 0.02),
                ],
              ),
              SizedBox(height: this.height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: this.width * 0.45,
                    height: this.height * 0.32,
                    child: TextButton(
                        child: PlayerBox(
                          width: this.width * 0.4,
                          height: this.height * 0.25,
                          playerImage: ("assets/common/") +
                              picsList[listOfGamers[0].pictureId]['image'],
                          playerName: listOfGamers[0].name,
                          //TODO: la lista con la info del servidor
                          listOrgansplayer: listOfGamers[0].bodyList,
                        ),
                        onPressed: () {
                          expansion = 1;
                          controlGame.add(true);
                          print(expansion.toString());
                        }),
                  ),
                ],
              ),
            ],
          ),
        );
      } else if (listOfGamers.length == 4) {
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: this.width * 0.02),
                  Container(
                    width: this.width * 0.45,
                    height: this.height * 0.45,
                    child: TextButton(
                        child: PlayerBox(
                          width: this.width * 0.4,
                          height: this.height * 0.4,
                          playerImage: ("assets/common/") +
                              picsList[listOfGamers[3].pictureId]['image'],
                          playerName: listOfGamers[3].name,
                          //TODO: la lista con la info del servidor
                          listOrgansplayer: listOfGamers[3].bodyList,
                        ),
                        onPressed: () {
                          expansion = 4;
                          controlGame.add(true);
                          print(expansion.toString());
                        }),
                  ),
                  SizedBox(width: this.width * 0.02),
                  Container(
                    width: this.width * 0.45,
                    height: this.height * 0.45,
                    child: TextButton(
                        child: PlayerBox(
                          width: this.width * 0.4,
                          height: this.height * 0.4,
                          playerImage: ("assets/common/") +
                              picsList[listOfGamers[2].pictureId]['image'],
                          playerName: listOfGamers[2].name,
                          //TODO: la lista con la info del servidor
                          listOrgansplayer: listOfGamers[2].bodyList,
                        ),
                        onPressed: () {
                          expansion = 3;
                          controlGame.add(true);
                          print(expansion.toString());
                        }),
                  ),
                  SizedBox(width: this.width * 0.02),
                ],
              ),
              SizedBox(height: this.height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: this.width * 0.02),
                  Container(
                    width: this.width * 0.45,
                    height: this.height * 0.45,
                    child: TextButton(
                        child: PlayerBox(
                          width: this.width * 0.4,
                          height: this.height * 0.4,
                          playerImage: ("assets/common/") +
                              picsList[listOfGamers[1].pictureId]['image'],
                          playerName: listOfGamers[1].name,
                          //TODO: la lista con la info del servidor
                          listOrgansplayer: listOfGamers[1].bodyList,
                        ),
                        onPressed: () {
                          expansion = 2;
                          controlGame.add(true);
                          print(expansion.toString());
                        }),
                  ),
                  SizedBox(width: this.width * 0.02),
                  Container(
                    width: this.width * 0.45,
                    height: this.height * 0.45,
                    child: TextButton(
                        child: PlayerBox(
                          width: this.width * 0.4,
                          height: this.height * 0.4,
                          playerImage: ("assets/common/") +
                              picsList[listOfGamers[0].pictureId]['image'],
                          playerName: listOfGamers[0].name,
                          //TODO: la lista con la info del servidor
                          listOrgansplayer: listOfGamers[0].bodyList,
                        ),
                        onPressed: () {
                          expansion = 1;
                          controlGame.add(true);
                          print(expansion.toString());
                        }),
                  ),
                  SizedBox(width: this.width * 0.02),
                ],
              ),
            ],
          ),
        );
      } else if (listOfGamers.length == 3) {
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: this.width * 0.02),
                  Container(
                    width: this.width * 0.45,
                    height: this.height * 0.45,
                    child: TextButton(
                        child: PlayerBox(
                          width: this.width * 0.4,
                          height: this.height * 0.4,
                          playerImage: ("assets/common/") +
                              picsList[listOfGamers[2].pictureId]['image'],
                          playerName: listOfGamers[2].name,
                          //TODO: la lista con la info del servidor
                          listOrgansplayer: listOfGamers[2].bodyList,
                        ),
                        onPressed: () {
                          expansion = 3;
                          controlGame.add(true);
                          print(expansion.toString());
                        }),
                  ),
                  SizedBox(width: this.width * 0.02),
                  Container(
                    width: this.width * 0.45,
                    height: this.height * 0.45,
                    child: TextButton(
                        child: PlayerBox(
                          width: this.width * 0.4,
                          height: this.height * 0.4,
                          playerImage: ("assets/common/") +
                              picsList[listOfGamers[1].pictureId]['image'],
                          playerName: listOfGamers[1].name,
                          //TODO: la lista con la info del servidor
                          listOrgansplayer: listOfGamers[1].bodyList,
                        ),
                        onPressed: () {
                          expansion = 2;
                          controlGame.add(true);
                          print(expansion.toString());
                        }),
                  ),
                  SizedBox(width: this.width * 0.02),
                ],
              ),
              SizedBox(height: this.height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: this.width * 0.02),
                  Container(
                    width: this.width * 0.45,
                    height: this.height * 0.45,
                    child: TextButton(
                        child: PlayerBox(
                          width: this.width * 0.4,
                          height: this.height * 0.4,
                          playerImage: ("assets/common/") +
                              picsList[listOfGamers[0].pictureId]['image'],
                          playerName: listOfGamers[0].name,
                          //TODO: la lista con la info del servidor
                          listOrgansplayer: listOfGamers[0].bodyList,
                        ),
                        onPressed: () {
                          expansion = 1;
                          controlGame.add(true);
                          print(expansion.toString());
                        }),
                  ),
                ],
              ),
            ],
          ),
        );
      } else if (listOfGamers.length == 2) {
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: this.width * 0.9,
                    height: this.height * 0.45,
                    child: TextButton(
                        child: PlayerBox(
                          width: this.width * 0.75,
                          height: this.height * 0.4,
                          playerImage: ("assets/common/") +
                              picsList[listOfGamers[1].pictureId]['image'],
                          playerName: listOfGamers[1].name,
                          //TODO: la lista con la info del servidor
                          listOrgansplayer: listOfGamers[1].bodyList,
                        ),
                        onPressed: () {
                          expansion = 2;
                          controlGame.add(true);
                          print(expansion.toString());
                        }),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: this.width * 0.9,
                    height: this.height * 0.45,
                    child: TextButton(
                        child: PlayerBox(
                          width: this.width * 0.75,
                          height: this.height * 0.4,
                          playerImage: ("assets/common/") +
                              picsList[listOfGamers[0].pictureId]['image'],
                          playerName: listOfGamers[0].name,
                          //TODO: la lista con la info del servidor
                          listOrgansplayer: listOfGamers[0].bodyList,
                        ),
                        onPressed: () {
                          expansion = 1;
                          controlGame.add(true);
                          print(expansion.toString());
                        }),
                  ),
                ],
              ),
            ],
          ),
        );
      } else if (listOfGamers.length == 1) {
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: this.width,
                    height: this.height * 0.9,
                    child: TextButton(
                        child: PlayerBox(
                          width: this.width * 0.9,
                          height: this.height * 0.75,
                          playerImage: ("assets/common/") +
                              picsList[listOfGamers[0].pictureId]['image'],
                          playerName: listOfGamers[0].name,
                          //TODO: la lista con la info del servidor
                          listOrgansplayer: listOfGamers[0].bodyList,
                        ),
                        onPressed: () {
                          expansion = 1;
                          controlGame.add(true);
                          print(expansion.toString());
                        }),
                  ),
                ],
              ),
            ],
          ),
        );
      } else if (numGamers < 2 || numGamers > 6) {
        print('Numero de jugadores incorrecto:' + numGamers.toString());
        return Container(
          width: 0.0,
          height: 0.0,
        );
      }
    }()));
  }
}
