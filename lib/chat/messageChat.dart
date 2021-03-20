import 'package:gatovidapp/chat/userChat.dart';

class Message {
  final User sender;
  final String text;

  Message({
    this.sender,
    this.text,
  });
}

// EXAMPLE CHATS ON HOME SCREEN
List<Message> messages = [
  Message(
    sender: juancarlos,
    text: 'Lo siento mucho. Me he equivocado. No volverá a ocurrir',
  ),
  Message(
    sender: cris,
    text: 'Eh, tramposo!!',
  ),
  Message(
    sender: cris,
    text: 'Eh tu',
  ),
  Message(
    sender: elena,
    text: 'Gracias',
  ),
  Message(
    sender: sofi,
    text: 'Bien jugado!',
  ),
  Message(
    sender: currentUser,
    text: 'No se jugar',
  ),
];
