import 'package:flutter/cupertino.dart';
import 'package:gatovidapp/partidas/card.dart';

class HandTemplate extends StatelessWidget {
  const HandTemplate({
    this.width,
    this.height,
    this.listCard,
  });

  final width;
  final height;
  final listCard;

  @override
  Widget build(BuildContext context) {
    if (listCard.length > 3) {
      print('Numero de cartas diferente a 3:' + listCard.length.toString());
      return Container(); // If the number of cards is different with 3, it's an error
    }
    if (listCard.length == 3) {
      return Container(
        height: this.height,
        width: this.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Draggable<CardData>(
              data: new CardData(ID: listCard[0]),
              feedback: CardTemplate(
                  width: this.width * 0.3,
                  height: this.height,
                  numCard: listCard[0]),
              child: CardTemplate(
                  width: this.width * 0.3,
                  height: this.height,
                  numCard: listCard[0]),
              childWhenDragging: Container(),
            ),
            SizedBox(
              width: this.width * 0.03,
            ),
            Draggable<CardData>(
              data: new CardData(ID: listCard[1]),
              feedback: CardTemplate(
                  width: this.width * 0.3,
                  height: this.height,
                  numCard: listCard[1]),
              child: CardTemplate(
                  width: this.width * 0.3,
                  height: this.height,
                  numCard: listCard[1]),
              childWhenDragging: Container(),
            ),
            SizedBox(
              width: this.width * 0.03,
            ),
            Draggable<CardData>(
              data: new CardData(ID: listCard[2]),
              feedback: CardTemplate(
                  width: this.width * 0.3,
                  height: this.height,
                  numCard: listCard[2]),
              child: CardTemplate(
                  width: this.width * 0.3,
                  height: this.height,
                  numCard: listCard[2]),
              childWhenDragging: Container(),
            ),
          ],
        ),
      );
    }
    if (listCard.length == 2) {
      return Container(
        height: this.height,
        width: this.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Draggable<CardData>(
              data: new CardData(ID: listCard[0]),
              feedback: CardTemplate(
                  width: this.width * 0.3,
                  height: this.height,
                  numCard: listCard[0]),
              child: CardTemplate(
                  width: this.width * 0.3,
                  height: this.height,
                  numCard: listCard[0]),
              childWhenDragging: Container(),
            ),
            SizedBox(
              width: this.width * 0.2,
            ),
            Draggable<CardData>(
              data: new CardData(ID: listCard[1]),
              feedback: CardTemplate(
                  width: this.width * 0.3,
                  height: this.height,
                  numCard: listCard[1]),
              child: CardTemplate(
                  width: this.width * 0.3,
                  height: this.height,
                  numCard: listCard[1]),
              childWhenDragging: Container(),
            ),
          ],
        ),
      );
    }
    if (listCard.length == 1) {
      return Container(
        height: this.height,
        width: this.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Draggable<CardData>(
              data: new CardData(ID: listCard[0]),
              feedback: CardTemplate(
                  width: this.width * 0.3,
                  height: this.height,
                  numCard: listCard[0]),
              child: CardTemplate(
                  width: this.width * 0.3,
                  height: this.height,
                  numCard: listCard[0]),
              childWhenDragging: Container(),
            ),
          ],
        ),
      );
    }
    if (listCard.length == 0) {
      return Container();
    }
  }
}
