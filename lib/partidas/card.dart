
import 'package:flutter/cupertino.dart';
import 'package:gatovidapp/services/models.dart';

class CardTemplate extends StatelessWidget {
  const CardTemplate({
    this.width,
    this.height,
    this.numCard,
  });

  final width;
  final height;
  final numCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      width: this.width,
      child: new Image.asset(("assets/common/") + cardList[this.numCard]['image']),
    );
  }

}