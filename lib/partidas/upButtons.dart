import 'package:flutter/material.dart';
import 'package:gatovidapp/services/websockets.dart';
import 'package:gatovidapp/services/models.dart';
import 'package:gatovidapp/popUps/exitPrivate.dart';
import 'package:gatovidapp/popUps/exitPublic.dart';

class UpButtons extends StatelessWidget {
  const UpButtons({
    this.width,
    this.height,
  });
  final width;
  final height;

  @override
  Widget build(BuildContext context) {
    if (publicIsPublicGame) {
      return Container(
        height: this.height,
        width: this.width,
        child: Row(
          children: [
            Container(
              width: this.width * 0.05,
            ),
            Expanded(
              child: TextButton(
                  onPressed: () {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) => ExitPublic(),
                    );
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: this.height,
                    color: Colors.black,
                  )),
            ),
            Container(
              width: this.width * 0.05,
            ),
            Expanded(
              child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/rules');
                  },
                  child: Icon(
                    Icons.help_outline,
                    size: this.height,
                    color: Colors.black,
                  )),
            ),
            Container(
              width: this.width * 0.05,
            ),
            Expanded(
              child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/chat');
                  },
                  child: Icon(
                    Icons.chat_outlined,
                    size: this.height,
                    color: Colors.black,
                  )),
            ),
            Container(
              width: this.width * 0.05,
            ),
          ],
        ),
      );
    }
    return Container(
      height: this.height,
      width: this.width,
      child: Row(
        children: [
          Container(
            width: this.width * 0.05,
          ),
          Expanded(
            child: TextButton(
                onPressed: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) => ExitPrivate(),
                  );
                },
                child: Icon(
                  Icons.arrow_back,
                  size: this.height,
                  color: Colors.black,
                )),
          ),
          Container(
            width: this.width * 0.05,
          ),
          Expanded(
            child: TextButton(
                onPressed: () {
                  gamePaused(true);
                },
                child: Icon(
                  Icons.pause_circle_outline_outlined,
                  size: this.height,
                  color: Colors.black,
                )),
          ),
          Container(
            width: this.width * 0.05,
          ),
          Expanded(
            child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/rules');
                },
                child: Icon(
                  Icons.help_outline,
                  size: this.height,
                  color: Colors.black,
                )),
          ),
          Container(
            width: this.width * 0.05,
          ),
          Expanded(
            child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/chat');
                },
                child: Icon(
                  Icons.chat_outlined,
                  size: this.height,
                  color: Colors.black,
                )),
          ),
          Container(
            width: this.width * 0.05,
          ),
        ],
      ),
    );
  }
}
