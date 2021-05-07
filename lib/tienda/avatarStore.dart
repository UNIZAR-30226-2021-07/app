import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gatovidapp/services/models.dart';
import 'package:gatovidapp/tienda/money.dart';
import 'package:gatovidapp/tienda/purchasable.dart';
import 'dart:async';

class PicturesStore extends StatefulWidget {
  @override
  _PicturesStoreState createState() => _PicturesStoreState();
}

class _PicturesStoreState extends State<PicturesStore> {
  StreamSubscription<bool> streamSubscription;

  @override
  void initState() {
    super.initState();
    streamSubscription = streamStat.listen((_) {
      setState(() {/* Empty instruction */});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF64DD17),
        title: const Text(
          'Elegir Avatar',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25.0, color: Colors.black),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.05), BlendMode.dstATop),
                image: AssetImage("assets/images/bg.png"),
                fit: BoxFit.cover)),
        height: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(height: MediaQuery.of(context).size.height * 0.025),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.075,
                ),
                MoneyTemplate(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: MediaQuery.of(context).size.height * 0.1),
                Container(
                  width: MediaQuery.of(context).size.width * 0.075,
                ),
              ],
            ),
            Expanded(
              child: new GridView.count(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1,
                  right: MediaQuery.of(context).size.width * 0.1,
                ),
                crossAxisSpacing: MediaQuery.of(context).size.width * 0.1,
                mainAxisSpacing: MediaQuery.of(context).size.width * 0.1,
                crossAxisCount: 2,
                children: List.generate(picsList.length - 1, (index) {
                  bool aux1 = false;
                  for (int i = 0; i < globalData.purchasedPicts.length; i++) {
                    if (index == globalData.purchasedPicts[i]) {
                      aux1 = true;
                      break;
                    }
                  }
                  bool aux2 = (index == globalData.picture);
                  return PurchaseTemplate(
                    width: MediaQuery.of(context).size.width * 0.35,
                    idPurchase: index,
                    typePurchase: 'profile_pic',
                    isPurchased: aux1,
                    isSelected: aux2,
                  );
                }),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            color: Color(0xff9C4DCC),
            child: TextButton(
              child: Text(
                'Tablero',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffffffff),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/boardStore');
              },
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            color: Color(0xff6A1B9A),
            child: TextButton(
              child: Text(
                'Avatar',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffffffff),
                ),
              ),
              onPressed: () {/*nothing*/},
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    streamSubscription.cancel();
  }
}
