import 'package:flutter/material.dart';
import 'package:gatovidapp/partidas/playerBox.dart';
import 'package:gatovidapp/services/models.dart';


Widget ExpandedPlayer (BuildContext context, bool expanded) {
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
                  //TODO: control sobre ampliacion o no
                  expanded = false;
                  print(expanded);
                },
              )
          ),
          Expanded(
              flex: 8,
              child: SizedBox()
          )
        ],
      ),
      Expanded(
        flex: 9,
        child: Container (
          child: PlayerBox(
            width: MediaQuery.of(context).size.width * 0.9 ,
            height: MediaQuery.of(context).size.height * 0.3,
            playerImage:
            ("assets/common/") + picsList[globalData.picture]['image'],
            playerName: globalData.name,
            //TODO: la lista con la info del servidor
            listOrgansplayer:  [
              [1, 6,5],
              [7,6],
              [4],
              [4]
            ],
          ),
        ),
      ),
      Expanded(
        child: SizedBox(),
      )
    ],
  );
}