import 'package:flutter/material.dart';
import 'package:gatovidapp/chat/messageChat.dart';
import 'package:gatovidapp/chat/userChat.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen();

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _listMessages(Message message, bool isMe, bool isSameUser) {
    if (isMe) {
      return Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topRight,
            child: Container(
              padding: EdgeInsets.all(MediaQuery.of(context).size.height *0.015),
              margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width * 0.02),
              decoration: BoxDecoration(
                color: Colors.lightGreenAccent,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Text(
                message.text,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            child: Container(
              padding: EdgeInsets.all(MediaQuery.of(context).size.height *0.015),
              margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width * 0.02),
              decoration: BoxDecoration(
                color: Colors.lightGreenAccent,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Text(
                message.text,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          !isSameUser
              ? Row(
                  children: <Widget>[
                    Container(child: Text(message.sender.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    )
                    ),
                  ],
                )
              : Container(
                  child: null,
                ),
        ],
      );
    }
  }

  _sendMessageArea() {
    final messageToSend = TextEditingController();
    return Container(
        child: Padding(
          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width *0.05,
            right: MediaQuery.of(context).size.width *0.05,
            top: MediaQuery.of(context).size.height * 0.023,
            bottom: MediaQuery.of(context).size.height * 0.023
          ),
          child: Row(
            children: <Widget>[
              ConstrainedBox(
                constraints: BoxConstraints.tight(Size(MediaQuery.of(context).size.width * 0.75, MediaQuery.of(context).size.height * 0.06)),
                child: TextFormField(
                  controller: messageToSend,
                  decoration: InputDecoration(
                     border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(width: 1.0)
                  ),
                  hintText: 'Escribir mensaje...',
                  isDense: true,
                  fillColor: Colors.white,
                  filled: true
                ),
              ),
            ),

            IconButton(
              icon: Icon(Icons.send),
              iconSize: MediaQuery.of(context).size.width * 0.075,
              color: Colors.black,
              onPressed: () { // Faltaria hacer que lo muestre por pantalla pero eso para el siguiente sprint
                if (messageToSend.text.isNotEmpty) {
                  messages.add(Message(
                    sender: currentUser,
                    text: messageToSend.text,
                  ));
                }
                messageToSend.text = '';
              }
            ),
          ],
        ),
      ),
    );
  }




  @override
  Widget build(BuildContext context) {
    int prevUserId;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: MediaQuery.of(context).size.height * 0.075,
        backgroundColor: Colors.lightGreenAccent,
        title: const Text('Chat',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 25.0,
              color: Colors.black),
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
              colorFilter: new ColorFilter.mode(Colors.white.withOpacity(0.05), BlendMode.dstATop),
              image: AssetImage("assets/images/bg.png"),
              fit: BoxFit.fitHeight,
            )
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                reverse: true,
                padding: EdgeInsets.all(MediaQuery.of(context).size.height *0.025),
                itemCount: messages.length,
                itemBuilder: (BuildContext context, int index) {
                  final Message message = messages[index];
                  final bool isMe = message.sender.id == currentUser.id;
                  final bool isSameUser = prevUserId == message.sender.id;
                  prevUserId = message.sender.id;
                  return _listMessages(message, isMe, isSameUser);
                },
              ),
            ),
            _sendMessageArea(),
          ],
        ),
      )
    );
  }
}
