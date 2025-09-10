import 'package:favorite_places/generated/l10n.dart';
import 'package:favorite_places/screens/add_place.dart';
import 'package:favorite_places/widgets/bottom_navidation_bar.dart';
import 'package:favorite_places/widgets/card_widget.dart';
import 'package:favorite_places/widgets/drawer_widget.dart';
import 'package:favorite_places/widgets/search_bar.dart';
import 'package:flutter/gestures.dart';
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
        padding: EdgeInsetsGeometry.only(top: 10),
        child: SingleChildScrollView(
          dragStartBehavior: DragStartBehavior.start,
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  S.of(context).discover,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge!.copyWith(fontFamily: 'Michelin_bold'),
                ),
              ),
              Container(
                width: 380,
                height: 280,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/adventure.jpg'),
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Divider(thickness: 1, color: Colors.grey),
              Column(
                children: [
                  CardWidget(title: S().italy),
                  CardWidget(title: S().japan),
                  CardWidget(title: S().southAfrica),
                  CardWidget(title: S().canada),
                  CardWidget(title: S().brazil),
                  CardWidget(title: S().france),
                  CardWidget(title: S().thailand),

                  
                  /*FutureBuilder(
                    future: readAddedPlaceInfo(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      }BottomNavidationBarWidget

                      return snapshot.data;
                    },
                  ),*/
                ],
              ),
            ],
          ),
        ),
        
      ),
      
      bottomNavigationBar: BottomNavidationBarWidget(),
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
