import 'package:flutter/material.dart';
import 'package:project6m2/src/features/chat/chat_message.dart';

class ChatAvatar extends StatelessWidget {
  final String path;
  final Function(BuildContext, String) enlargePhoto;

  const ChatAvatar({
    Key? key,
    required this.path,
    required this.enlargePhoto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: CircleAvatar(
        backgroundImage: AssetImage(path),
        radius: 24,
        backgroundColor: Colors.grey[200],
      ),
      onTap: () {
        enlargePhoto(context, path);
      },
    );
  }
}

class ChatText extends StatelessWidget {
  final int senderCode;
  final ChatMessage message;
  // final String time;
  static final months = <String>[
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  ChatText({
    Key? key,
    required this.senderCode,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String date = int.parse(message.time
                .toString()
                .substring(0, 10)
                .substring(message.time.toString().substring(0, 10).length - 2))
            .toString() +
        " " +
        months[int.parse(
                message.time.toString().substring(0, 10).substring(5, 7)) -
            1] +
        " " +
        message.time.toString().substring(0, 10).substring(0, 4);

    int hourint = (int.parse(message.time.toString().substring(11, 13)));
    String hour = (hourint >= 12
        ? (hourint == 12
                ? hourint.toString()
                : "0" + (hourint - 12).toString()) +
            " PM"
        : (hourint == 0 ? "12" : "0" + hourint.toString()) + " AM");
    String time = hour.substring(0, 2) +
        message.time.toString().substring(13, 16) +
        hour.substring(2);

    return Flexible(
      child: Column(
        crossAxisAlignment:
            senderCode == 1 ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Text(
              time + " " + date,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: senderCode == 1
                    ? [Color(0xFFFC5C7D), Color(0xFF6A82FB)]
                    : [Color(0xFFA7BFE8), Color(0xFF6190E8)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
                topLeft: Radius.circular(senderCode != 1 ? 0 : 25),
                topRight: Radius.circular(senderCode != 1 ? 25 : 0),
              ),
            ),
            padding: EdgeInsets.all(12),
            child: Text(
              message.message,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessageItem extends StatelessWidget {
  final ChatMessage message;
  final String senderImagePath;
  final String receiverImagePath;
  final Function(BuildContext, String) enlargePhoto;

  const ChatMessageItem({
    Key? key,
    required this.message,
    required this.senderImagePath,
    required this.receiverImagePath,
    required this.enlargePhoto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int senderCode = message.sender == "Amay Dixit" ? 0 : 1;
    final path = senderCode == 0 ? senderImagePath : receiverImagePath;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
      child: Row(
        mainAxisAlignment:
            senderCode == 1 ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          senderCode != 1
              ? ChatAvatar(path: path, enlargePhoto: enlargePhoto)
              : SizedBox(width: 50),
          SizedBox(width: 12),
          ChatText(senderCode: senderCode, message: message),
          SizedBox(width: 12),
          senderCode == 1
              ? ChatAvatar(path: path, enlargePhoto: enlargePhoto)
              : SizedBox(width: 50),
        ],
      ),
    );
  }
}
