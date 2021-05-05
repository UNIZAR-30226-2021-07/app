import 'package:flutter/material.dart';
import 'package:gatovidapp/partidas/card.dart';

class StackCardTemplate extends StatelessWidget {
  const StackCardTemplate({
    this.width,
    this.height,
    this.listCard,
  });

  final width;
  final height;
  final listCard;

  @override
  Widget build(BuildContext context) {
    if (listCard.length == 1) {
      return Container(
        height: this.height,
        width: this.width,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: this.height * 0.0,
              child: CardTemplate(
                  width: this.width * 0.9,
                  height: this.height * 0.8,
                  numCard: listCard[0].id),
            ),
          ],
        ),
      );
    }
    if (listCard.length == 2) {
      return Container(
        height: this.height,
        width: this.width,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: this.height * 0.0,
              child: CardTemplate(
                  width: this.width * 0.9,
                  height: this.height * 0.8,
                  numCard: listCard[0].id),
            ),
            Positioned(
              top: this.height * 0.1,
              child: CardTemplate(
                  width: this.width * 0.9,
                  height: this.height * 0.8,
                  numCard: listCard[1].id),
            ),
          ],
        ),
      );
    }
    return Container(
      height: this.height,
      width: this.width,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: this.height * 0.0,
            child: CardTemplate(
                width: this.width * 0.9,
                height: this.height * 0.8,
                numCard: listCard[0].id),
          ),
          Positioned(
            top: this.height * 0.1,
            child: CardTemplate(
                width: this.width * 0.9,
                height: this.height * 0.8,
                numCard: listCard[1].id),
          ),
          Positioned(
            top: this.height * 0.2,
            child: CardTemplate(
                width: this.width * 0.9,
                height: this.height * 0.8,
                numCard: listCard[2].id),
          ),
        ],
      ),
    );
  }
}
