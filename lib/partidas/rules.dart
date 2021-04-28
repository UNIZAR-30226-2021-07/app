import 'package:flutter/material.dart';
import 'package:gatovidapp/partidas/stackCard.dart';
import 'package:gatovidapp/partidas/playerBox.dart';
import 'package:gatovidapp/services/models.dart';
import 'package:gatovidapp/partidas/body.dart';
import 'package:gatovidapp/partidas/hand.dart';
import 'package:gatovidapp/partidas/card.dart';

class Rules extends StatefulWidget {
  @override
  _RulesState createState() => _RulesState();
}

class _RulesState extends State<Rules> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF64DD17),
        title: const Text(
          'Ayuda',
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
            Row(
              children: [
                /*StackCardTemplate(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.3,
                    listCard: [1]),
                StackCardTemplate(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.3,
                    listCard: [1, 2]),
                StackCardTemplate(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.3,
                    listCard: [1, 2, 3]),
              //],
            //),*/
                CardTemplate(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.2,
                  numCard: 8,
            ),
            HandTemplate(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.3,
                listCard: [1, 2]),
            ]
            ),
            PlayerBox(
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.15,
              playerImage:
                  ("assets/common/") + picsList[globalData.picture]['image'],
              playerName: globalData.name,
            ),
            SizedBox(height: 10),
            /*PlayerBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.3,
              playerImage:
                  ("assets/common/") + picsList[globalData.picture]['image'],
              playerName: globalData.name,
            ),*/
            Body(
              width: 300.0,
              height: 150.0,
              listOrgans: [],
            )
          ],
        ),
      ),
    );
  }
}
