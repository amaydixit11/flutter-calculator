import 'package:flutter/material.dart';
import 'package:project6m2/src/features/chat/chat_appbar.dart';
import 'package:project6m2/src/features/chat/chat_message_item.dart';
import 'chat_message.dart';
import 'chat_parser.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = [];
  String _currDate = DateTime.now().toString().substring(0, 10);
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _listViewKey = GlobalKey();
  final List<GlobalKey> _itemKeys = [];

  static const Map<String, List<Map<String, String>>> users = {
    "sender": [
      {
        "Cheekoo": 'lib/public/ADP.png',
      },
    ],
    "receiver": [
      {
        "Sakshi": 'lib/public/SDP.jpeg',
        // "Didi": 'lib/public/DDP.png',
      }
    ]
  };
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
  @override
  void initState() {
    super.initState();
    _getMessages();
    _scrollController.addListener(_updateAppBarDate);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_updateAppBarDate);
    _scrollController.dispose();
    super.dispose();
  }

  void _getMessages() async {
    final parser = ChatParser();
    final messages = await parser.parseChatFile();
    setState(() {
      _messages.addAll(messages);
      _itemKeys.addAll(List.generate(_messages.length, (_) => GlobalKey()));
    });
  }

  void _appBarDate(String date) {
    setState(() {
      _currDate = int.parse(date.substring(date.length - 2)).toString() +
          " " +
          months[int.parse(date.substring(5, 7)) - 1] +
          " " +
          date.substring(0, 4);
    });
  }

  void _updateAppBarDate() {
    if (_scrollController.hasClients) {
      final scrollOffset = _scrollController.offset;
      final viewportHeight = _scrollController.position.viewportDimension;

      for (int i = 0; i < _itemKeys.length; i++) {
        final context = _itemKeys[i].currentContext;
        if (context != null) {
          final RenderBox box = context.findRenderObject() as RenderBox;
          final position = box.localToGlobal(Offset.zero);

          if (position.dy >= 0 && position.dy < viewportHeight) {
            final topMessageDate =
                _messages[i].time.toString().substring(0, 10);
            _appBarDate(topMessageDate);
            break;
          }
        }
      }
    }
  }

  void enlargePhoto(BuildContext context, String path) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Enlarged Photo'),
            ),
            body: Center(
              child: Image.asset(path),
            ),
          );
        },
      ),
    );
  }

  void _scrollToBottom() {
    _scrollController.jumpTo(
      _scrollController.position.maxScrollExtent,
      // duration: Duration(seconds: 2),
      // curve: Curves.easeOut,
    );
  }

  void _scrollXScreensDown(int x, int t) {
    final screenHeight = MediaQuery.of(context).size.height;
    final currentOffset = _scrollController.offset;
    final targetOffset = currentOffset + (screenHeight * x);
    final maxScrollExtent = _scrollController.position.maxScrollExtent;

    final offset =
        targetOffset > maxScrollExtent ? maxScrollExtent : targetOffset;

    _scrollController.animateTo(
      offset,
      duration: Duration(seconds: t),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final senderImagePath = users["sender"]![0].values.first;
    final receiverImagePath = users["receiver"]![0].values.first;
    return Container(
      child: Scaffold(
        // backgroundColor: Colors.black,
        appBar: ChatAppBar(
            senderImagePath: senderImagePath,
            users: users,
            currDate: _currDate),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                key: _listViewKey,
                controller: _scrollController,
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];

                  return Container(
                    key: _itemKeys[index],
                    child: ChatMessageItem(
                      message: message,
                      senderImagePath: senderImagePath,
                      receiverImagePath: receiverImagePath,
                      enlargePhoto: enlargePhoto,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _scrollXScreensDown(50, 3);
          },
          child: Icon(Icons.arrow_downward),
        ),
      ),
    );
  }
}
