import 'dart:convert';
import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/models/places_data.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;

class LocationWidget extends StatefulWidget {
  const LocationWidget({super.key});

  @override
  State<LocationWidget> createState() {
    return _LocationWidget();
  }
}

class _LocationWidget extends State<LocationWidget> {
  PlaceLocation? _pickedLocation;
  var isGettingLocation = false;
  Place? place;

  String locationImage = '';

  void _viewLocationOnMap() async {
    final lat = placesData[0].location!.latitude;
    final lng = placesData[0].location!.longitude;
    setState(() {
      locationImage =
          'https://maps.googleapis.com/maps/api/staticmap?center=$lat,$lng&zoom=8&size=600x300&maptype=roadmap&markers=color:red%7Clabel:S%7C$lat,$lng&key=AIzaSyCKG1eZCp7f3FuPokCQ4Q27bkPe6VyUscU';
      _pickedLocation = PlaceLocation(
        latitude: lat,
        longitude: lng,
        address: 'italy',
      );
    });
  }

  void _getCurrentLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    setState(() {
      isGettingLocation = true;
    });

    locationData = await location.getLocation();
    final lat = locationData.latitude;
    final lng = locationData.longitude;

    if (lat == null || lng == null) {
      return;
    }

    final url = Uri.parse(
      'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=AIzaSyCKG1eZCp7f3FuPokCQ4Q27bkPe6VyUscU',
    );

    final response = await http.get(url);
    final resData = await json.decode(response.body);
    final address = resData['results'][0]['formatted_address'];

    setState(() {
      _pickedLocation = PlaceLocation(
        latitude: lat,
        longitude: lng,
        address: address,
      );
      isGettingLocation = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget previweContent = Text('No Location Choosen');

    if (_pickedLocation != null) {
      previweContent = Image.network(
        locationImage,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      );
    }
    //print("Herrree");
    previweContent = Image.network(
      locationImage,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    );
      if (isGettingLocation) {
      previweContent = CircularProgressIndicator();
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          height: 290.0,
          width: double.infinity,
          alignment: Alignment.center,
          child: Container(padding: EdgeInsetsGeometry.all(1),
          decoration: BoxDecoration(
             
          ),
          child: previweContent,
        )),
        SizedBox(height: 14),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 12,
          children: [
            ElevatedButton.icon(
              onPressed: _getCurrentLocation,
              label: Text('Get current location'),
              icon: Icon(Icons.location_on),
            ),
            ElevatedButton.icon(
              onPressed: _viewLocationOnMap,
              label: Text('View on Map'),
              icon: Icon(Icons.add_location_alt),
            ),
          ],
        ),
      ],
    );
  }
}


/// API AIzaSyCKG1eZCp7f3FuPokCQ4Q27bkPe6VyUscU