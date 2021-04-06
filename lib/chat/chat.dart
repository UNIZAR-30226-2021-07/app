import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:gatovidapp/chat/models.dart';

String token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTYxNzcyMjc0OSwianRpIjoiNWU1Mzk1YjQtMmFkYy00OTUxLWFiM2MtOTAzNDAyNjE0MzZlIiwibmJmIjoxNjE3NzIyNzQ5LCJ0eXBlIjoiYWNjZXNzIiwic3ViIjoidGVzdF91c2VyMkBnbWFpbC5jb20iLCJleHAiOjE2MTc3MjM2NDl9.SJ28vX7TSGIAvgkjUzPbYSiQ6W-XPc_XOx2kqNOr2u8';
Socket socket;

Color greenAppBar = Color(0xff64DD17);
Color blackWords = Color(0xff000000);
Color purpleButton = Color(0xff6A1B9A);
Color purpleCamera = Color(0xff9C4DCC);
Color whiteWords = Color(0xffffffff);
Color redButton = Color(0xffFF0000);
Color greenChat = Color(0xffDCF8C6);

class ChatScreen extends StatefulWidget {
  ChatScreen();


  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {


  final messageToSend = TextEditingController();
  final scrollControl = new ScrollController();

  @override
  void initState() {
    super.initState();
    startWebSocket();
  }

  _listMessages(Message message, bool isMe) {
    if (isMe) {
      return Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topRight,
            child: Container(
              padding: EdgeInsets.all(MediaQuery.of(context).size.height *0.015),
              margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width * 0.02),
              decoration: BoxDecoration(
                color: greenChat,
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
                textAlign:TextAlign.right,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: blackWords,
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
                color: greenChat,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: RichText(
                textAlign:TextAlign.left,
                text: TextSpan(
                  text: message.sender + ": ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: blackWords,
                  ),
                  children: [
                    TextSpan(
                      text: message.text,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: blackWords,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ),
        ],
      );
    }
  }

  _sendMessageArea() {
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
                constraints: BoxConstraints.tight(Size(MediaQuery.of(context).size.width * 0.75, MediaQuery.of(context).size.height * 0.09)),
                child: TextFormField(
                  controller: messageToSend,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(width: 1.0)),
                      hintText: 'Escribir mensaje...',
                      isDense: true,
                      fillColor: whiteWords,
                      filled: true
                  ),
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.022,
                    fontWeight: FontWeight.normal,
                    color: blackWords,
                  ),
                ),
              ),

            IconButton(
              icon: Icon(Icons.send),
              iconSize: MediaQuery.of(context).size.width * 0.075,
              color: blackWords,
                onPressed: () {
                  if (messageToSend.text.isNotEmpty) {
                    sendMessageWebSocket(messageToSend.text);
                  }
                  messageToSend.text = '';
                }
            ),
          ],
        ),
      ),
    );
  }
  _listMessagesLayout() {
    ListView ret = ListView.builder(
      reverse: true,
      padding: EdgeInsets.all(MediaQuery
          .of(context)
          .size
          .height * 0.025),
      controller: scrollControl,
      itemCount: messages.length,
      itemBuilder: (BuildContext context, int index) {
        final Message message = messages[index];
        final bool isMe = message.sender == "Manolo"; // TODO: Change for the current user in posteriors branches
        return _listMessages(message, isMe);
      },
    );
    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: greenAppBar,
        title: const Text(
          'Chat',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
              color: Color(0xff000000)),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded),
            color: blackWords,
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: new Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: new ColorFilter.mode(Colors.white.withOpacity(0.05), BlendMode.dstATop),
              image: AssetImage("assets/images/bg.png"),
              fit: BoxFit.cover,
            )
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: _listMessagesLayout(),
            ),
            _sendMessageArea(),
          ],
        ),
      )
    );
  }
}
