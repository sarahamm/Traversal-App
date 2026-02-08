import 'package:flutter/material.dart';

class BottomNavidationBarWidget extends StatefulWidget {
  const BottomNavidationBarWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _StatebottomNavigationBar();
  }
}

class _StatebottomNavigationBar extends State<BottomNavidationBarWidget> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.star),label: "favorite"),
          BottomNavigationBarItem(icon: Icon(Icons.add_box),label: "Add"),
        ],
        currentIndex: _selectedIndex,
        onTap: (value) => setState(() {
          _selectedIndex = value;
        }),
        selectedItemColor: Colors.cyan,
      ),
    );
  }
}
