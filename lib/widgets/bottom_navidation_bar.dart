import 'package:favorite_places/generated/l10n.dart';
import 'package:favorite_places/main.dart';
import 'package:favorite_places/screens/add_place.dart';
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

  static List<Widget> get _widgetOptions => <Widget>[
    DiscoverPlacesScreen(),
    PlacesList(title: S().favouritePlaces),
    AddPlace(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.star), label: "favorite"),
        BottomNavigationBarItem(icon: Icon(Icons.add_box), label: "Add"),
      ],
      currentIndex: _selectedIndex,
      onTap: (value) => setState(() {
        _selectedIndex = value;
        _onItemTapped(_selectedIndex);
      }),
      selectedItemColor: colorScheme.primary,
    );
  }
}
