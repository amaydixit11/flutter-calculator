import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart' show rootBundle;
import 'package:project6m2/src/features/chat/chat_message.dart';

class ChatParser {
  Future<List<ChatMessage>> parseChatFile() async {
    // final file = await _chatsFile;
    // final contents = await file.readAsString();
    final contents = await _json;
    final List<dynamic> jsonData = json.decode(contents);

    List<ChatMessage> chats = [];
    for (var chat in jsonData) {
      chats.add(ChatMessage(
        message: chat["Message"],
        sender: chat["Sender"],
        time: _parseTime(chat["Time"], chat["Date"]),
      ));
    }
    return chats;
  }

  DateTime _parseTime(String time, String date) {
    int hour = int.parse(time.split(' ')[0].split(':')[0]);
    int minute = int.parse(time.split(' ')[0].split(':')[1]);
    final List<String> datee = date.split('/');
    if (time.split(' ')[1] == 'pm' && hour != 12) {
      hour += 12;
    } else if (time.split(' ')[1] == 'am' && hour == 12) {
      hour = 0;
    }
    return DateTime(2000 + int.parse(datee[2]), int.parse(datee[1]),
        int.parse(datee[0]), hour, minute);
  }

  Future<File> get _chatsFile async {
    final path = await _publicPath;
    return File('$path/lib/public/parsed.json');
  }

  Future<String> get _publicPath async {
    Directory current = Directory.current;
    return current.path;
  }

  Future<String> get _json async {
    String jsonString = await rootBundle.loadString('lib/public/parsed.json');
    // Optionally, you can parse jsonString here if needed
    return jsonString;
  }
}
