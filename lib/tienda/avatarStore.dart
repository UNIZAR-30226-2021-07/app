import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gatovidapp/tienda/money.dart';
import 'package:gatovidapp/tienda/purchasable.dart';

class PicturesStore extends StatefulWidget {
  @override
  _PicturesStoreState createState() => _PicturesStoreState();
}

class _PicturesStoreState extends State<PicturesStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF64DD17),
        title: const Text(
          'Elegir Foto',
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
      body: SafeArea(
        child: Column(
          children: [
            Container(height: MediaQuery.of(context).size.height * 0.025),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width: MediaQuery.of(context).size.width * 0.075,),
                MoneyTemplate(width: MediaQuery.of(context).size.width * 0.85,height: MediaQuery.of(context).size.height * 0.1),
                Container(width: MediaQuery.of(context).size.width * 0.075,),
              ],
            ),
            Container(height: MediaQuery.of(context).size.height * 0.025),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width: MediaQuery.of(context).size.width * 0.1,),
                PurchaseTemplate(width: MediaQuery.of(context).size.width * 0.35, idPurchase: 0, typePurchase: 'picture', isPurchased: true, isSelected: true,),
                Container(width: MediaQuery.of(context).size.width * 0.1,),
                PurchaseTemplate(width: MediaQuery.of(context).size.width * 0.35, idPurchase: 1, typePurchase: 'picture', isPurchased: true, isSelected: false,),
                Container(width: MediaQuery.of(context).size.width * 0.1,),
              ],
            ),
            Container(height: MediaQuery.of(context).size.height * 0.025),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width: MediaQuery.of(context).size.width * 0.1,),
                PurchaseTemplate(width: MediaQuery.of(context).size.width * 0.35, idPurchase: 0, typePurchase: 'picture', isPurchased: false, isSelected: false,),
                Container(width: MediaQuery.of(context).size.width * 0.1,),
                PurchaseTemplate(width: MediaQuery.of(context).size.width * 0.35, idPurchase: 1, typePurchase: 'picture', isPurchased: true, isSelected: false,),
                Container(width: MediaQuery.of(context).size.width * 0.1,),
              ],
            ),
            Text("Pantalla tienda avatar perfil"),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/boardStore');
                },
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFF9C4DCC),
                    onPrimary: Colors.white,
                    minimumSize: Size(double.infinity, 20)),
                child: Text(
                  "Tablero",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }
}
