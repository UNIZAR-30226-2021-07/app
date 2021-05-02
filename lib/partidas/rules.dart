import 'package:flutter/material.dart';
import 'package:gatovidapp/partidas/body.dart';
import 'package:gatovidapp/partidas/hand.dart';
import 'package:gatovidapp/partidas/playersTable.dart';

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
            Row(children: [
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
              Container(
                child: HandTemplate(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.1,
                    listCard: [1, 2, 3]),
              ),
              HandTemplate(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.1,
                  listCard: [4, 0, 5]),
            ]),
            SizedBox(height: 10),
            PlayersTable(context),
            SizedBox(height: 10),
            /*PlayerBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.3,
              playerImage:
                  ("assets/common/") + picsList[globalData.picture]['image'],
              playerName: globalData.name,
            ),*/
            /* Body(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.15,
              listOrgans: [],
            ),
            Body(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.15,
              listOrgans: [
                [0]
              ],
            ),
            Body(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.15,
              listOrgans: [
                [2, 7],
                [1, 11]
              ],
            ),
            Body(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.15,
              listOrgans: [
                [1, 6],
                [2, 7],
                [3]
              ],
            ),*/
            Body(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.15,
              listOrgans: [
                [1, 6],
                [7, 6],
                [4],
                [4]
              ],
            ),
          ],
        ),
      ),
    );
  }
}
