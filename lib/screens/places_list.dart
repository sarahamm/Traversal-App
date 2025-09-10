import 'package:favorite_places/models/data_base.dart';
import 'package:favorite_places/widgets/card_widget.dart';
import 'package:favorite_places/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesList extends ConsumerStatefulWidget {
  const PlacesList({super.key, required this.title});
  final String title;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _PlacesListState();
  }
}

class _PlacesListState extends ConsumerState<PlacesList> {
  late String placeTitleEntered = widget.title;

  final DataBaseService _dataBaseService = DataBaseService.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget places() {
      return FutureBuilder<List<Map<String, Object?>>>(
        future: _dataBaseService.returnPlace(widget.title , 0,5),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || (snapshot.data as List).isEmpty) {
            return Center(child: Text("Nothing Is Here 🛠️"));
          }
          final places = snapshot.data!;
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: places.length,
            itemBuilder: (BuildContext context, int index) {
              List<String> placesTitles = places
                  .map((e) => e["PlaceTitle"] as String)
                  .toList();
              return CardWidget(title: placesTitles[index]);
            },
          );
        },
      );
    }

    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(title: Text(placeTitleEntered)),
      body: places(),
    );
  }
}
