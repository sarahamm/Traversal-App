import 'dart:convert';

import 'package:favorite_places/models/place.dart';
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
  //final lat = placesData[0].location!.latitude;
  //final lng = placesData[0].location!.latitude;

  String get locationImage {
    if (_pickedLocation == null) {
      return '';
    }
    final lat = _pickedLocation!.latitude;
    final lng = _pickedLocation!.longitude;

    return 'https://maps.googleapis.com/maps/api/staticmap?center=$lat,$lng=&zoom=16&size=600x300&maptype=roadmap&markers=color:blue%7Clabel:S%7C$lat,$lng&key=AIzaSyCKG1eZCp7f3FuPokCQ4Q27bkPe6VyUscU';
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
    //print(" the address is refared to : $address");
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
    if (isGettingLocation) {
      previweContent = CircularProgressIndicator();
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      //mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          height: 170.0,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.white),
          ),

          child: previweContent,
        ),
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
              onPressed: () {},
              label: Text('select on map'),
              icon: Icon(Icons.add_location_alt),
            ),
          ],
        ),
      ],
    );
  }
}





// using geocoding from google api to translate the longtitude and latutiued to human readable location 





/// API AIzaSyCKG1eZCp7f3FuPokCQ4Q27bkPe6VyUscU