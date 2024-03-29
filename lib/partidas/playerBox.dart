import 'package:flutter/material.dart';
import 'package:gatovidapp/partidas/body.dart';
import 'package:gatovidapp/services/models.dart';

class PlayerBox extends StatelessWidget {
  const PlayerBox(
      {this.width,
      this.height,
      this.playerName,
      this.playerImage,
      this.playerTarget,
      this.listOrgansplayer});

  final width;
  final height;
  final playerName;
  final playerTarget;
  final playerImage;
  final listOrgansplayer;

  @override
  Widget build(BuildContext context) {
    Color bordeColor;
    if (currentTurnPlayer == this.playerName) {
      bordeColor = Color(0xFF6A1B9A);
    } else {
      bordeColor = Color(0x006A1B9A);
    }
    return Container(
      height: this.height,
      width: this.width,
      decoration: BoxDecoration(
        border: Border.all(
          color: bordeColor,
          width: this.width * 0.01,
        ),
        borderRadius: BorderRadius.circular(this.width * 0.05),
        color: Color(0xFFC4C4C4),
      ),
      child: Column(
        children: [
          Container(
            width: this.width,
            height: this.height * 0.35,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CircleAvatar(
                      backgroundImage: AssetImage(this.playerImage)),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    margin: EdgeInsets.only(
                      left: this.width * 0.05,
                      right: this.width * 0.05,
                      top: this.width * 0.05,
                      bottom: this.width * 0.05,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(this.width * 0.03),
                        color: Colors.white,
                        border: Border()),
                    child: Center(
                      child: Text(
                        this.playerName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: this.height * 0.09),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          //Espacio para el cuerpo
          Container(
            child: Body(
              width: this.width * 0.95,
              height: this.height * 0.6,
              listOrgans: this.listOrgansplayer,
              name: this.playerTarget,
            ),
          )
        ],
      ),
    );
  }
}
