import 'package:flutter/material.dart';
import 'package:gatovidapp/partidas/playerBox.dart';
import 'package:gatovidapp/services/models.dart';

class playersTableTemplate extends StatelessWidget {
  const playersTableTemplate({
    this.width,
    this.height,
  });

  final width;
  final height;

  @override
    Widget build(BuildContext context) {
    return Container(
      child: (() {
      if (numGamers == 6) {
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
                              picsList[globalData.picture]['image'],
                          playerName: globalData.name,
                          //TODO: la lista con la info del servidor
                          listOrgansplayer: [
                            [1, 6, 5],
                            [7, 6],
                            [4],
                            [4]
                          ],
                        ),
                        onPressed: () {

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
                              picsList[globalData.picture]['image'],
                          playerName: globalData.name,
                          //TODO: la lista con la info del servidor
                          listOrgansplayer: [
                            [1, 6, 5],
                            [7, 6],
                            [4],
                            [4]
                          ],
                        ),
                        onPressed: () {

                        }),
                  ),
                  SizedBox(width: this.width * 0.02),
                ],
              ),
              SizedBox(height:this.height * 0.01),
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
                              picsList[globalData.picture]['image'],
                          playerName: globalData.name,
                          //TODO: la lista con la info del servidor
                          listOrgansplayer: [
                            [1, 6, 5],
                            [7, 6],
                            [4],
                            [4]
                          ],
                        ),
                        onPressed: () {

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
                              picsList[globalData.picture]['image'],
                          playerName: globalData.name,
                          //TODO: la lista con la info del servidor
                          listOrgansplayer: [
                            [1, 6, 5],
                            [7, 6],
                            [4],
                            [4]
                          ],
                        ),
                        onPressed: () {

                        }),
                  ),
                  SizedBox(width: this.width * 0.02),
                ],
              ),
              SizedBox(height:this.height * 0.01),
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
                              picsList[globalData.picture]['image'],
                          playerName: globalData.name,
                          //TODO: la lista con la info del servidor
                          listOrgansplayer: [
                            [1, 6, 5],
                            [7, 6],
                            [4],
                            [4]
                          ],
                        ),
                        onPressed: () {

                        }),
                  ),
                ],
              ),
            ],
          ),
        );
      } else if (numGamers == 5) {
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
                              picsList[globalData.picture]['image'],
                          playerName: globalData.name,
                          //TODO: la lista con la info del servidor
                          listOrgansplayer: [
                            [1, 6, 5],
                            [7, 6],
                            [4],
                            [4]
                          ],
                        ),
                        onPressed: () {

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
                              picsList[globalData.picture]['image'],
                          playerName: globalData.name,
                          //TODO: la lista con la info del servidor
                          listOrgansplayer: [
                            [1, 6, 5],
                            [7, 6],
                            [4],
                            [4]
                          ],
                        ),
                        onPressed: () {

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
                              picsList[globalData.picture]['image'],
                          playerName: globalData.name,
                          //TODO: la lista con la info del servidor
                          listOrgansplayer: [
                            [1, 6, 5],
                            [7, 6],
                            [4],
                            [4]
                          ],
                        ),
                        onPressed: () {

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
                              picsList[globalData.picture]['image'],
                          playerName: globalData.name,
                          //TODO: la lista con la info del servidor
                          listOrgansplayer: [
                            [1, 6, 5],
                            [7, 6],
                            [4],
                            [4]
                          ],
                        ),
                        onPressed: () {

                        }),
                  ),
                  SizedBox(width: this.width * 0.02),
                ],
              ),
            ],
          ),
        );
      } else if (numGamers == 4) {
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
                              picsList[globalData.picture]['image'],
                          playerName: globalData.name,
                          //TODO: la lista con la info del servidor
                          listOrgansplayer: [
                            [1, 6, 5],
                            [7, 6],
                            [4],
                            [4]
                          ],
                        ),
                        onPressed: () {

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
                              picsList[globalData.picture]['image'],
                          playerName: globalData.name,
                          //TODO: la lista con la info del servidor
                          listOrgansplayer: [
                            [1, 6, 5],
                            [7, 6],
                            [4],
                            [4]
                          ],
                        ),
                        onPressed: () {

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
                              picsList[globalData.picture]['image'],
                          playerName: globalData.name,
                          //TODO: la lista con la info del servidor
                          listOrgansplayer: [
                            [1, 6, 5],
                            [7, 6],
                            [4],
                            [4]
                          ],
                        ),
                        onPressed: () {

                        }),
                  ),
                ],
              ),
            ],
          ),
        );
      } else if (numGamers == 3) {
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
                              picsList[globalData.picture]['image'],
                          playerName: globalData.name,
                          //TODO: la lista con la info del servidor
                          listOrgansplayer: [
                            [1, 6, 5],
                            [7, 6],
                            [4],
                            [4]
                          ],
                        ),
                        onPressed: () {

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
                              picsList[globalData.picture]['image'],
                          playerName: globalData.name,
                          //TODO: la lista con la info del servidor
                          listOrgansplayer: [
                            [1, 6, 5],
                            [7, 6],
                            [4],
                            [4]
                          ],
                        ),
                        onPressed: () {

                        }),
                  ),
                ],
              ),
            ],
          ),
        );
      } else if (numGamers == 2) {
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: this.width * 0.9,
                    height: this.height * 0.9,
                    child: TextButton(
                        child: PlayerBox(
                          width: this.width * 0.75,
                          height: this.height * 0.75,
                          playerImage: ("assets/common/") +
                              picsList[globalData.picture]['image'],
                          playerName: globalData.name,
                          //TODO: la lista con la info del servidor
                          listOrgansplayer: [
                            [1, 6, 5],
                            [7, 6],
                            [4],
                            [4]
                          ],
                        ),
                        onPressed: () {

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
