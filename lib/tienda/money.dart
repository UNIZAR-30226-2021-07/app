import 'package:flutter/material.dart';
import 'package:gatovidapp/services/models.dart';

class MoneyTemplate extends StatelessWidget {
  const MoneyTemplate({
    this.width,
    this.height,
  });

  final width;
  final height;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: this.height,
        width: this.width,
        decoration: BoxDecoration(
            color: Color(0xff9C4DCC),
            border: Border.all(
              color: Color(0xffffffff),
              width: 8,
            ),
            borderRadius: BorderRadius.circular(20.0)),
        child: Row(
          children: [
            Expanded(flex: 2, child: SizedBox()),
            Expanded(
              flex: 14,
              child: Text(
                'Saldo gatuno',
                style: TextStyle(
                  fontSize: this.width * 0.06,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffffffff),
                ),
              ),
            ),
            Expanded(flex: 6, child: SizedBox()),
            Expanded(
              flex: 9,
              child: Row(
                children: [
                  Text(
                    globalData.coins,
                    style: TextStyle(
                      fontSize: this.width * 0.06,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffffffff),
                    ),
                  ),
                  Container(
                    width: this.width * 0.03,
                  ),
                  Icon(Icons.pets, size: this.width * 0.1, color: Colors.amber),
                  Container(
                    width: this.width * 0.03,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
