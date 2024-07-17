// lib/src/features/chat_formatter/chat_message.dart

class ChatMessage {
  // final String date;
  final DateTime time;
  final String sender;
  final String message;

  ChatMessage(
      {
      // required this.date,
      required this.time,
      required this.sender,
      required this.message});

  @override
  String toString() {
    return 'ChatMessage{time: $time, sender: $sender, message: $message}';
  }
}
