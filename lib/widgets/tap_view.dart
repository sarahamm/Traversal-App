import 'package:favorite_places/generated/l10n.dart';
import 'package:favorite_places/widgets/bottom_sheet.dart';
import 'package:favorite_places/widgets/location.dart';
import 'package:flutter/material.dart';
import 'package:favorite_places/models/places_data.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TapViewWidget extends StatefulWidget {
  const TapViewWidget({super.key, required this.title});
  final String title;

  @override
  State<StatefulWidget> createState() {
    return _TapViewWidgetState();
  }
}

class _TapViewWidgetState extends State<TapViewWidget>
    with SingleTickerProviderStateMixin {
  late final TabController _tabcontroller;
  final index = placesData;
  late int indexNum;

  pageIndex() {
    for (int i = 0; i < placesData.length; i++) {
      if (widget.title == placesData[i].title) {
        final pageDescription = placesData[i].description.toString();
        return pageDescription;
      }
    }
    return "Nothing Here... ";
  }

  //initState() runs once when the widget is inserted in the widget tree.
  @override
  void initState() {
    super.initState();
    _tabcontroller = TabController(length: 3, vsync: this);

    indexNum = placesData.indexWhere((place) => place.title == widget.title);
    if (indexNum == -1) indexNum = 0;
  }

  //Prevents memory leaks by cleaning up the controller when widget is removed.
  @override
  void dispose() {
    _tabcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> galleryGrid = placesData[indexNum].imageGallary!
        .map(
          (url) => CachedNetworkImage(
            imageUrl: url,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Michelin_bold'),),
        bottom: TabBar(
          controller: _tabcontroller,

          tabs: <Widget>[
            Tab(
              text: S.of(context).aboutplaceTap,
              icon: Icon(Icons.info_outline_rounded),
            ),
            Tab(
              text: S.of(context).gallaryplaceTap,
              icon: Icon(Icons.photo_library_rounded),
            ),
            Tab(
              text: S.of(context).pickLandplaceTap,
              icon: Icon(Icons.flight_land_rounded),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabcontroller,
        children: <Widget>[
          Padding(
            padding: EdgeInsetsGeometry.all(16),
            child: Column(
              children: [
                Image(image: AssetImage(placesData[indexNum].imageUrl!)),
                SizedBox(height: 18.0),
                Text(
                  pageIndex(),
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    wordSpacing: 2.0,
                  ),
                ),
              ],
            ),
          ),

          GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 6,
            crossAxisSpacing: 3,

            children: <Widget>[...galleryGrid],
          ),

          Center(child: LocationWidget()),
        ],
      ),


      floatingActionButton:BottomSheetWidget(title: widget.title,),
    );
  }
}
