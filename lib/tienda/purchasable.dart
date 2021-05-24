import 'package:flutter/material.dart';
import 'package:gatovidapp/services/models.dart';
import 'package:gatovidapp/services/profile_modify.dart';
import 'package:gatovidapp/services/profile_stadistics.dart';
import 'package:gatovidapp/popUps/confirmPurchase.dart';

class PurchaseTemplate extends StatelessWidget {
  const PurchaseTemplate({
    this.width,
    this.typePurchase,
    this.idPurchase,
    this.isPurchased,
    this.isSelected,
  });

  final width;
  final idPurchase;
  final typePurchase;
  final isPurchased;
  final isSelected;

  @override
  Widget build(BuildContext context) {
    String pathImage;
    String costPutchase;
    String typeModify;
    if (typePurchase == 'board') {
      pathImage = ("assets/common/") +
          boardList[idPurchase]['image'].replaceAll('svg', 'png');
      costPutchase = boardList[idPurchase]['cost'].toString();
      typeModify = 'board';
    } else {
      pathImage = ("assets/common/") +
          picsList[idPurchase]['image'].replaceAll('svg', 'png');
      costPutchase = picsList[idPurchase]['cost'].toString();
      typeModify = 'picture';
    }

    if (isSelected == true) {
      return Container(
        height: this.width,
        width: this.width,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(pathImage),
              fit: BoxFit.cover,
            ),
            border: Border.all(
              width: 2, //                   <--- border width here
            ),
            borderRadius: BorderRadius.circular(20.0)),
        child: TextButton(
          onPressed: () {
            // nothing
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: this.width * 0.5,
                width: this.width * 0.5,
                decoration: BoxDecoration(
                  color: Color(0xff3BB54A),
                  borderRadius: BorderRadius.circular(360.0),
                  border: Border.all(
                    width: this.width * 0.025,
                  ),
                ),
                child: Icon(Icons.check,
                    size: this.width * 0.4, color: Colors.white),
              ),
            ],
          ),
        ),
      );
    }
    if (isPurchased == true) {
      return Container(
        height: this.width,
        width: this.width,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(pathImage),
              fit: BoxFit.cover,
            ),
            border: Border.all(
              width: 2, //                   <--- border width here
            ),
            borderRadius: BorderRadius.circular(20.0)),
        child: TextButton(
          child: Container(),
          onPressed: () async {
            // ok name
            if (await modifyData(typeModify, this.idPurchase.toString())) {
              await getData();
              controllerStat.add(true);
            }
          },
        ),
      );
    } else {
      return Container(
        height: this.width,
        width: this.width,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(pathImage),
              fit: BoxFit.cover,
            ),
            border: Border.all(
              width: 2, //                   <--- border width here
            ),
            borderRadius: BorderRadius.circular(20.0)),
        child: TextButton(
          onPressed: () async {
            // ok name
            costPurchaseSelected = costPutchase;
            typePurchaseSelected = this.typePurchase;
            idPurchaseSelected = this.idPurchase.toString();
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) => PurchaseAlert(),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.lock, size: this.width * 0.4, color: Colors.black),
              Container(
                height: this.width * 0.3,
                width: this.width * 0.7,
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(
                    width: this.width * 0.025,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      costPutchase,
                      style: TextStyle(
                        fontSize: this.width * 0.15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff000000),
                      ),
                    ),
                    Container(
                      width: this.width * 0.03,
                    ),
                    Icon(Icons.pets,
                        size: this.width * 0.15, color: Colors.amber),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
