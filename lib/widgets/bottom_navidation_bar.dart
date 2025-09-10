import 'package:favorite_places/generated/l10n.dart';
import 'package:favorite_places/screens/discover_places.dart';
import 'package:favorite_places/screens/places_list.dart';
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
    final bottomWidget = <Widget>[
      DiscoverPlacesScreen(),
      PlacesList(title: S().favouritePlaces),
      PlacesList(title: "Places added")
    ];


    return Scaffold(
      body: bottomWidget[_selectedIndex],
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
        selectedItemColor: Color.fromARGB(255, 4, 102, 136),
      ),
    );
  }
}
