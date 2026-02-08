import 'package:favorite_places/generated/l10n.dart';
//import 'package:favorite_places/screens/add_place.dart';
//import 'package:favorite_places/widgets/bottom_navidation_bar.dart';
import 'package:favorite_places/widgets/card_widget.dart';
import 'package:favorite_places/widgets/drawer_widget.dart';
import 'package:favorite_places/widgets/search_bar.dart';
//import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class DiscoverPlacesScreen extends StatefulWidget {
  const DiscoverPlacesScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DiscoverPlaceScrenState();
  }
}

class _DiscoverPlaceScrenState extends State<DiscoverPlacesScreen> {
  /* Future readAddedPlaceInfo() async {
    SharedPreferences readPref = await SharedPreferences.getInstance();
    String getTitle = readPref.getString("PlaceTitle") ?? "no Places added";
    String getSubTitle = readPref.getString("PlaceSubTitle") ?? "nothing";
    //String getImage = readPref.getString("PlaceImage") ?? "assets/noimage.jpg";

    if (getTitle != "no Places added") {
      return Card(
        child: ListTile(
          title: Text(getTitle),
          subtitle: Text(getSubTitle),
          leading: Image(
            width: 120,
            height: 120,
            fit: BoxFit.fill,
            image: AssetImage("assets/noimage.jpg"),
          ),
        ),
      );
    }
  }

  void addNewPlaceState() {
    setState(() {
      readAddedPlaceInfo();
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: Text(
          S.of(context).welcome,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView(
          children: [
            Center(
              child: Text(
                S.of(context).discover,
                style: Theme.of(
                  context,
                ).textTheme.titleLarge!.copyWith(fontFamily: 'Michelin_bold'),
              ),
            ),

            const SizedBox(height: 10),

            Container(
              width: 380,
              height: 280,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/adventure.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),

            const Divider(thickness: 1, color: Colors.grey),

            // ListView.builder inside ListView must use shrinkWrap
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 7,
              itemBuilder: (context, index) {
                final titles = [
                  S.of(context).italy,
                  S.of(context).japan,
                  S.of(context).southAfrica,
                  S.of(context).canada,
                  S.of(context).brazil,
                  S.of(context).france,
                  S.of(context).thailand,
                ];

                return CardWidget(title: titles[index]);
              },
            ),
          ],
        ),
      ),

      //bottomNavigationBar: BottomNavidationBarWidget(),
      /*floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: Icon(Icons.add, color: Theme.of(context).colorScheme.surface),
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (ctx) => AddPlace()));
        },
      ),*/
    );
  }
}
