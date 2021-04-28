import 'package:flutter/material.dart';
import 'package:gatovidapp/partidas/stackCard.dart';
import 'package:gatovidapp/partidas/card.dart';
import 'package:gatovidapp/partidas/stackCard.dart';


class Body extends StatelessWidget {
  const Body({
    this.width,
    this.height,
    this.listOrgans,
  });

  final width;
  final height;
  final listOrgans;

  @override
  Widget build(BuildContext context) {
    if (listOrgans.length > 4) {
      print('Numero de cartas organos diferente a 4:' + listOrgans.length.toString());
      return Container(); // If the number of cards is different with 3, it's an error
    }
    if (listOrgans.length == 0) {
      return Container(
        height: this.height,
        width: this.width,
        color: Colors.blue,
        child: DragTarget<CardTemplate>(
          builder: (context, candidateItems, rejectedItems){
            return Container();
          },
          onAccept: (CardTemplate card) {
            print(card.numCard);
          },

        )
      );
    }
    if (listOrgans.length == 1) {
      return Container(
        child: Row (
          children: [
            Expanded(
              child: DragTarget()
            ),
            Expanded (
              child: StackCardTemplate()
            ),
            Expanded(
              child: DragTarget()
            )
          ],
        )
      );
    }
    if (listOrgans.length == 2) {

    }
    if (listOrgans.length == 3) {

    }
    if (listOrgans.length == 4) {

    }
  }
}
