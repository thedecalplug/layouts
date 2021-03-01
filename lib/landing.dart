import 'package:flutter/material.dart';
import './inventory.dart';
import './layouts.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = [Layout(), Inventory()];

  void onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.event_note,
              ),
              label: 'Inventory'),
        ],
        currentIndex: _selectedIndex,
        onTap: onItemTap,
        backgroundColor: Colors.green,
        selectedItemColor: Colors.black,
      ),
    );
  }
}
