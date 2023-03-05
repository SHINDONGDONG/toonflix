import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toonflix/screens/home.dart';
import 'package:toonflix/screens/stateful_screen.dart';

class BottomScreen extends StatefulWidget {
  const BottomScreen({Key? key}) : super(key: key);


  @override
  State<BottomScreen> createState() => _BottomScreenState();
}
class _BottomScreenState extends State<BottomScreen> {

  static final List<Widget>_widgetOption=<Widget>[
    const Home(),
    const StatefulScreen(),
  ];

  int _currentIndex = 0;
  void _onItemTapped(int index){
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _widgetOption[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _currentIndex,
        elevation: 10,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        selectedItemColor: Colors.blueGrey,
        backgroundColor: Color(0xFF181818),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.add_a_photo_outlined), label: ""),
        ],

      )
      ,
    );
  }
}
