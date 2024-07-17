import 'package:flutter/material.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String senderImagePath;
  final Map<String, List<Map<String, String>>> users;
  final String currDate;

  const ChatAppBar({
    Key? key,
    required this.senderImagePath,
    required this.users,
    required this.currDate,
  }) : super(key: key);

  void _search() {}

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(senderImagePath),
                  radius: 20,
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(users["sender"]![0].keys.first,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    )),
                Text(currDate,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    )),
              ],
            ),
          ),
        ],
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            // colors: [Colors.pink[300]!, Colors.pink[200]!],
            colors: [Colors.transparent, Colors.transparent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
      elevation: 4.0,
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: _search,
        ),
        IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () {
            // Add more actions here
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
