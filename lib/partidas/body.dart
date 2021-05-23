import 'package:flutter/material.dart';
import 'package:gatovidapp/partidas/stackCard.dart';
import 'package:gatovidapp/services/websockets.dart';
import 'package:gatovidapp/services/models.dart';

class Body extends StatelessWidget {
  const Body({
    this.width,
    this.height,
    this.listOrgans,
    this.name,
  });

  final width;
  final height;
  final listOrgans;
  final name;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: this.height,
        width: this.width,
        child: Row(
          children: [
            Container(
              width: this.width * 0.02,
              height: this.height,
            ),
            DragTarget<CardData>(
              builder: (context, candidateItems, rejectedItems) {
                if (listOrgans[0].length > 0) {
                  return StackCardTemplate(
                    width: this.width * 0.225,
                    height: this.height,
                    listCard: listOrgans[0],
                  );
                }
                return Container(
                  height: this.height,
                  width: this.width * 0.225,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Positioned(
                        top: this.height * 0.0,
                        child: Container(
                          width: this.width * 0.9 * 0.225,
                          height: this.height * 0.8,
                          child: Image.asset("assets/common/borde.png"),
                        ),
                      ),
                    ],
                  ),
                );
              },
              onAcceptWithDetails: (data) {
                return true;
              },
              onAccept: (data) {
                playCard(this.name, 0, data);
              },
            ),
            Container(
              width: this.width * 0.02,
              height: this.height,
            ),
            DragTarget<CardData>(
              builder: (context, candidateItems, rejectedItems) {
                if (listOrgans[1].length > 0) {
                  return StackCardTemplate(
                    width: this.width * 0.225,
                    height: this.height,
                    listCard: listOrgans[1],
                  );
                }
                return Container(
                  height: this.height,
                  width: this.width * 0.225,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Positioned(
                        top: this.height * 0.0,
                        child: Container(
                          width: this.width * 0.9 * 0.225,
                          height: this.height * 0.8,
                          child: Image.asset("assets/common/borde.png"),
                        ),
                      ),
                    ],
                  ),
                );
              },
              onAcceptWithDetails: (data) {
                return true;
              },
              onAccept: (data) {
                playCard(this.name, 1, data);
              },
            ),
            Container(
              width: this.width * 0.02,
              height: this.height,
            ),
            DragTarget<CardData>(
              builder: (context, candidateItems, rejectedItems) {
                if (listOrgans[2].length > 0) {
                  return StackCardTemplate(
                    width: this.width * 0.225,
                    height: this.height,
                    listCard: listOrgans[2],
                  );
                }
                return Container(
                  height: this.height,
                  width: this.width * 0.225,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Positioned(
                        top: this.height * 0.0,
                        child: Container(
                          width: this.width * 0.9 * 0.225,
                          height: this.height * 0.8,
                          child: Image.asset("assets/common/borde.png"),
                        ),
                      ),
                    ],
                  ),
                );
              },
              onAcceptWithDetails: (data) {
                return true;
              },
              onAccept: (data) {
                playCard(this.name, 2, data);
              },
            ),
            Container(
              width: this.width * 0.02,
              height: this.height,
            ),
            DragTarget<CardData>(
              builder: (context, candidateItems, rejectedItems) {
                if (listOrgans[3].length > 0) {
                  return StackCardTemplate(
                    width: this.width * 0.225,
                    height: this.height,
                    listCard: listOrgans[3],
                  );
                }
                return Container(
                  height: this.height,
                  width: this.width * 0.225,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Positioned(
                        top: this.height * 0.0,
                        child: Container(
                          width: this.width * 0.9 * 0.225,
                          height: this.height * 0.8,
                          child: Image.asset("assets/common/borde.png"),
                        ),
                      ),
                    ],
                  ),
                );
              },
              onAcceptWithDetails: (data) {
                return true;
              },
              onAccept: (data) {
                playCard(this.name, 3, data);
              },
            ),
            Container(
              width: this.width * 0.02,
              height: this.height,
            ),
          ],
        ));
  }
}
