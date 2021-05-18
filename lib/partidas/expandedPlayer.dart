import 'package:flutter/material.dart';
import 'package:gatovidapp/partidas/playerBox.dart';
import 'package:gatovidapp/services/models.dart';

Widget expandedPlayer(BuildContext context) {
  return Column(
    children: [
      Row(
        children: [
          Expanded(
              flex: 2,
              child: IconButton(
                icon: Icon(Icons.close),
                color: Colors.black,
                iconSize: 50,
                onPressed: () {
                  expansion = 0;
                  print(expansion);
                  controlGame.add(true);
                },
              )),
          Expanded(flex: 8, child: SizedBox())
        ],
      ),
      Expanded(
        flex: 9,
        child: Container(
          child: PlayerBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.35,
            playerImage: ("assets/common/") +
                picsList[listOfGamers[expansion - 1].pictureId]['image'],
            playerName: listOfGamers[expansion - 1].displayname,
            listOrgansplayer:
                listOfGamersBody[listOfGamers[expansion - 1].name],
            playerTarget: listOfGamers[expansion - 1].name,
          ),
        ),
      ),
      Expanded(
        child: SizedBox(),
      )
    ],
  );
}
