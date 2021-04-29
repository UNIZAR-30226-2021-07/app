import 'package:flutter/material.dart';
import 'package:gatovidapp/partidas/stackCard.dart';
import 'package:gatovidapp/partidas/card.dart';
import 'package:gatovidapp/partidas/stackCard.dart';


class Body extends StatelessWidget {
  const Body({
    this.width,
    this.height,
    this.listOrgans,
  });

  final width;
  final height;
  final listOrgans;

  @override
  Widget build(BuildContext context) {
    if (listOrgans.length == 0) {
      return Container(
        height: this.height,
        width: this.width,
        child: DragTarget<CardData>(
          builder: (context, candidateItems, rejectedItems){
            return Container();
          },
          onAcceptWithDetails: (data){
            return true;
          },
          onAccept: (data) {
            print('Recibido: '+data.id.toString());
          },
        )
      );
    }
    if (listOrgans.length == 1) {
      return Container(
        height: this.height,
        width: this.width,
        child: Row (
          children: [
            DragTarget<CardData>(
              builder: (context, candidateItems, rejectedItems){
                return Container(width: this.width*0.25, height:this.height,);
              },
              onAcceptWithDetails: (data){
                return true;
              },
              onAccept: (data) {
                print('RecibidoLeft: '+data.id.toString());
              },
            ),
            DragTarget<CardData>(
              builder: (context, candidateItems, rejectedItems){
                return StackCardTemplate(width: this.width*0.5, height:this.height, listCard: listOrgans[0],);
              },
              onAcceptWithDetails: (data){
                return true;
              },
              onAccept: (data) {
                print('RecibidoCard1: '+data.id.toString());
              },
            ),
            DragTarget<CardData>(
              builder: (context, candidateItems, rejectedItems){
                return Container(width: this.width*0.25, height:this.height,);
              },
              onAcceptWithDetails: (data){
                return true;
              },
              onAccept: (CardData data) {
                print('RecibidoRight: '+data.id.toString());
              },
            ),
          ],
        )
      );
    }
    if (listOrgans.length == 2) {
      return Container(
          height: this.height,
          width: this.width,
          child: Row (
            children: [
              DragTarget<CardData>(
                builder: (context, candidateItems, rejectedItems){
                  return Container(width: this.width*0.175, height:this.height,);
                },
                onAcceptWithDetails: (data){
                  return true;
                },
                onAccept: (data) {
                  print('RecibidoLeft: '+data.id.toString());
                },
              ),
              DragTarget<CardData>(
                builder: (context, candidateItems, rejectedItems){
                  return StackCardTemplate(width: this.width*0.3, height:this.height, listCard: listOrgans[0],);
                },
                onAcceptWithDetails: (data){
                  return true;
                },
                onAccept: (data) {
                  print('RecibidoCard1: '+data.id.toString());
                },
              ),
              Container(width: this.width*0.05, height:this.height,),
              DragTarget<CardData>(
                builder: (context, candidateItems, rejectedItems){
                  return StackCardTemplate(width: this.width*0.3, height:this.height, listCard: listOrgans[1],);
                },
                onAcceptWithDetails: (data){
                  return true;
                },
                onAccept: (data) {
                  print('RecibidoCard2: '+data.id.toString());
                },
              ),
              DragTarget<CardData>(
                builder: (context, candidateItems, rejectedItems){
                  return Container(width: this.width*0.175, height:this.height,);
                },
                onAcceptWithDetails: (data){
                  return true;
                },
                onAccept: (CardData data) {
                  print('RecibidoRight: '+data.id.toString());
                },
              ),
            ],
          )
      );
    }
    if (listOrgans.length == 3) {
      return Container(
          height: this.height,
          width: this.width,
          child: Row (
            children: [
              DragTarget<CardData>(
                builder: (context, candidateItems, rejectedItems){
                  return Container(width: this.width*0.125, height:this.height,);
                },
                onAcceptWithDetails: (data){
                  return true;
                },
                onAccept: (data) {
                  print('RecibidoLeft: '+data.id.toString());
                },
              ),
              DragTarget<CardData>(
                builder: (context, candidateItems, rejectedItems){
                  return StackCardTemplate(width: this.width*0.23, height:this.height, listCard: listOrgans[0],);
                },
                onAcceptWithDetails: (data){
                  return true;
                },
                onAccept: (data) {
                  print('RecibidoCard1: '+data.id.toString());
                },
              ),
              Container(width: this.width*0.025, height:this.height,),
              DragTarget<CardData>(
                builder: (context, candidateItems, rejectedItems){
                  return StackCardTemplate(width: this.width*0.23, height:this.height, listCard: listOrgans[1],);
                },
                onAcceptWithDetails: (data){
                  return true;
                },
                onAccept: (data) {
                  print('RecibidoCard2: '+data.id.toString());
                },
              ),
              Container(width: this.width*0.025, height:this.height,),
              DragTarget<CardData>(
                builder: (context, candidateItems, rejectedItems){
                  return StackCardTemplate(width: this.width*0.23, height:this.height, listCard: listOrgans[2],);
                },
                onAcceptWithDetails: (data){
                  return true;
                },
                onAccept: (data) {
                  print('RecibidoCard3: '+data.id.toString());
                },
              ),
              DragTarget<CardData>(
                builder: (context, candidateItems, rejectedItems){
                  return Container(width: this.width*0.125, height:this.height,);
                },
                onAcceptWithDetails: (data){
                  return true;
                },
                onAccept: (CardData data) {
                  print('RecibidoRight: '+data.id.toString());
                },
              ),
            ],
          )
      );
    }
    if (listOrgans.length == 4) {
      return Container(
          height: this.height,
          width: this.width,
          child: Row (
            children: [
              Container(width: this.width*0.02, height:this.height,),
              DragTarget<CardData>(
                builder: (context, candidateItems, rejectedItems){
                  return StackCardTemplate(width: this.width*0.225, height:this.height, listCard: listOrgans[0],);
                },
                onAcceptWithDetails: (data){
                  return true;
                },
                onAccept: (data) {
                  print('RecibidoCard1: '+data.id.toString());
                },
              ),
              Container(width: this.width*0.02, height:this.height,),
              DragTarget<CardData>(
                builder: (context, candidateItems, rejectedItems){
                  return StackCardTemplate(width: this.width*0.225, height:this.height, listCard: listOrgans[1],);
                },
                onAcceptWithDetails: (data){
                  return true;
                },
                onAccept: (data) {
                  print('RecibidoCard2: '+data.id.toString());
                },
              ),
              Container(width: this.width*0.02, height:this.height,),
              DragTarget<CardData>(
                builder: (context, candidateItems, rejectedItems){
                  return StackCardTemplate(width: this.width*0.225, height:this.height, listCard: listOrgans[2],);
                },
                onAcceptWithDetails: (data){
                  return true;
                },
                onAccept: (data) {
                  print('RecibidoCard3: '+data.id.toString());
                },
              ),
              Container(width: this.width*0.02, height:this.height,),
              DragTarget<CardData>(
                builder: (context, candidateItems, rejectedItems){
                  return StackCardTemplate(width: this.width*0.225, height:this.height, listCard: listOrgans[3],);
                },
                onAcceptWithDetails: (data){
                  return true;
                },
                onAccept: (data) {
                  print('RecibidoCard4: '+data.id.toString());
                },
              ),
              Container(width: this.width*0.02, height:this.height,),
            ],
          )
      );
    }
    if (listOrgans.length > 4) {
      print('Numero de cartas diferente a 3:' + listOrgans.length.toString());
      return Container(); // If the number of cards is different with 3, it's an error
    }
  }
}
