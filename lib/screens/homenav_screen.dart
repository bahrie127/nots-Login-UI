import 'package:flutter/material.dart';
import 'package:thirdnoteapptry/screens/NavigationIndex/main_screen.dart';
import 'package:thirdnoteapptry/screens/NavigationIndex/note.dart';

class HomeNavigationScreen extends StatefulWidget {
  const HomeNavigationScreen({Key? key}) : super(key: key);

  @override
  State<HomeNavigationScreen> createState() => _HomeNavigationScreenState();
}

class _HomeNavigationScreenState extends State<HomeNavigationScreen> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static final List<Widget> _widgetOptions = <Widget>[
    const Mainscreen(),
    const NoteScreen(),
    const Text(
      'Index 2: ToDo List',
      style: optionStyle,
    ),
    const Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Color(0xFFb19cd9),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note_alt_sharp),
            label: 'Notes',
            backgroundColor: Color(0xFFb19cd9),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_rounded),
            label: 'ToDo List',
            backgroundColor: Color(0xFFb19cd9),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Color(0xFFb19cd9),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color(0xFF1D1C1A),
        onTap: _onItemTapped,
      ),
    );
  }
}
