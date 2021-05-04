import 'package:flutter/material.dart';
import 'package:gatovidapp/partidas/card.dart';
import 'package:gatovidapp/services/models.dart';

class HandTemplate extends StatelessWidget {
  const HandTemplate({
    this.width,
    this.height,
  });

  final width;
  final height;

  @override
  Widget build(BuildContext context) {
    if (handOfPlayer.length > 3) {
      print('Numero de cartas diferente a 3:' + handOfPlayer.length.toString());
      return Container(); // If the number of cards is different with 3, it's an error
    }
    if (handOfPlayer.length == 3) {
      return Container(
        height: this.height,
        width: this.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Draggable<CardData>(
              data: handOfPlayer[0],
              feedback: CardTemplate(
                  width: this.width * 0.3,
                  height: this.height,
                  numCard: handOfPlayer[0].id),
              child: CardTemplate(
                  width: this.width * 0.3,
                  height: this.height,
                  numCard: handOfPlayer[0].id),
              childWhenDragging: Container(),
            ),
            SizedBox(
              width: this.width * 0.03,
            ),
            Draggable<CardData>(
              data: handOfPlayer[1],
              feedback: CardTemplate(
                  width: this.width * 0.3,
                  height: this.height,
                  numCard: handOfPlayer[1].id),
              child: CardTemplate(
                  width: this.width * 0.3,
                  height: this.height,
                  numCard: handOfPlayer[1].id),
              childWhenDragging: Container(),
            ),
            SizedBox(
              width: this.width * 0.03,
            ),
            Draggable<CardData>(
              data: handOfPlayer[2],
              feedback: CardTemplate(
                  width: this.width * 0.3,
                  height: this.height,
                  numCard: handOfPlayer[2].id),
              child: CardTemplate(
                  width: this.width * 0.3,
                  height: this.height,
                  numCard: handOfPlayer[2].id),
              childWhenDragging: Container(),
            ),
          ],
        ),
      );
    }
    if (handOfPlayer.length == 2) {
      return Container(
        height: this.height,
        width: this.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Draggable<CardData>(
              data: handOfPlayer[0],
              feedback: CardTemplate(
                  width: this.width * 0.3,
                  height: this.height,
                  numCard: handOfPlayer[0].id),
              child: CardTemplate(
                  width: this.width * 0.3,
                  height: this.height,
                  numCard: handOfPlayer[0].id),
              childWhenDragging: Container(),
            ),
            SizedBox(
              width: this.width * 0.2,
            ),
            Draggable<CardData>(
              data: handOfPlayer[1],
              feedback: CardTemplate(
                  width: this.width * 0.3,
                  height: this.height,
                  numCard: handOfPlayer[1].id),
              child: CardTemplate(
                  width: this.width * 0.3,
                  height: this.height,
                  numCard: handOfPlayer[1].id),
              childWhenDragging: Container(),
            ),
          ],
        ),
      );
    }
    if (handOfPlayer.length == 1) {
      return Container(
        height: this.height,
        width: this.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Draggable<CardData>(
              data: handOfPlayer[0],
              feedback: CardTemplate(
                  width: this.width * 0.3,
                  height: this.height,
                  numCard: handOfPlayer[0].id),
              child: CardTemplate(
                  width: this.width * 0.3,
                  height: this.height,
                  numCard: handOfPlayer[0].id),
              childWhenDragging: Container(),
            ),
          ],
        ),
      );
    }
    return Container();
  }
}
