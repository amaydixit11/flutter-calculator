import 'package:flutter/material.dart';
import 'package:project6m2/src/features/home/presentation/pages/home_chat_screen.dart';
import 'package:project6m2/src/features/home/presentation/pages/home_notes_screen.dart';
import 'package:project6m2/src/features/home/presentation/pages/home_gallery_screen.dart';
import 'package:project6m2/src/features/home/presentation/pages/home_counter_screen.dart';
import 'package:project6m2/src/features/home/presentation/pages/home_map_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const ChatsPage(),
    const NotesPage(),
    const GalleryPage(),
    const CounterPage(),
    const MapPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Bar'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        destinations: const <NavigationDestination>[
          NavigationDestination(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
          NavigationDestination(
            icon: Icon(Icons.note),
            label: 'Notes',
          ),
          NavigationDestination(
            icon: Icon(Icons.photo),
            label: 'Gallery',
          ),
          NavigationDestination(
            icon: Icon(Icons.countertops),
            label: 'Counter',
          ),
          NavigationDestination(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
        ],
      ),
    );
  }
}
