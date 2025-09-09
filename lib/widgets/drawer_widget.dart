import 'package:favorite_places/generated/l10n.dart';
import 'package:favorite_places/models/data_base.dart';
import 'package:favorite_places/screens/discover_places.dart';
import 'package:favorite_places/screens/devices.dart';
import 'package:favorite_places/screens/places_list.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() {
    return _DrawerWidgetState();
  }
}

class _DrawerWidgetState extends State<DrawerWidget> with ChangeNotifier {
  List<bool> isSelected = [true, false];
  Locale locale = const Locale('ar');

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/travel.jpg'),
                fit: BoxFit.cover,
              ),
            ),

            child: Text(
              S.of(context).travel,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.amberAccent,
                fontFamily: 'Michelin_bold',
              ),
            ),
          ),

          ListTile(
            leading: Icon(Icons.search_outlined),
            title: Text(
              S().explore,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) => DiscoverPlacesScreen()),
              );
            },
          ),
          SizedBox(height: 15.0),

          ListTile(
            leading: Icon(Icons.checklist_rounded),
            title: Text(
              S.of(context).visited,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => PlacesList(title: S().visited),
                ),
              );
            },
          ),
          SizedBox(height: 15.0),

          ListTile(
            leading: Icon(Icons.star_rate_rounded),
            title: Text(
              S.of(context).favouritePlaces,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => PlacesList(title: S().favouritePlaces),
                ),
              );
            },
          ),
          SizedBox(height: 15.0),

          ListTile(
            leading: Icon(Icons.not_listed_location_rounded),
            title: Text(
              S.of(context).wantToVisit,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => PlacesList(title: S().wantToVisit),
                ),
              );
            },
          ),
          SizedBox(height: 15.0),

          ListTile(
            leading: Icon(Icons.photo_album_rounded),
            title: Text(
              S.of(context).planned,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => PlacesList(title: S().planned),
                ),
              );
            },
          ),

          ListTile(
            leading: Icon(Icons.mobile_friendly),
            title: Text(
              S().devices,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (ctx) => DevicesScreen()));
            },
          ),
          const SizedBox(height: 42.0),

          ListTile(
            leading: ToggleButtons(
              isSelected: isSelected,
              onPressed: (index) {
                setState(() {
                  for (int i = 0; i < isSelected.length; i++) {
                    isSelected[i] = i == index;
                  }
                  if (index == 0) {
                    locale = const Locale('ar');
                  } else {
                    locale = const Locale('en');
                  }
                });
                notifyListeners();
              },
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text("EN"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text("AR"),
                ),
              ],
            ),
          ),

          ListTile(
            leading: Icon(Icons.delete),
            title: Text("Delete Database"),
            onTap: () {
              DataBaseService.instance.myDeleteDataBase();
            },
          ),
          const SizedBox(height: 42.0),
        ],
      ),
    );
  }
}
