
import 'package:flutter/cupertino.dart';
import 'package:gatovidapp/services/models.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      child: SvgPicture.asset(("assets/common/") + cardList[this.numCard]['image']),
    );
  }

}