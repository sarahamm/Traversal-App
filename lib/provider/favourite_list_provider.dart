import 'package:favorite_places/models/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StateListNotifier extends StateNotifier<List<Place>> {
  // intial state (empty list) ; constructor function
  StateListNotifier() : super([]);

  // add the methods that we need to change the data
  void addPlace(String place, String subtitle, String imageUrl) {
    final newPlace = Place(
      title: place,
      subTitle: subtitle,
      flags: [],
      tags: [],
      imageUrl: imageUrl,
    );

    state = [...state, newPlace];
    // add the new item to the list
  }
}

final favListProvider = StateNotifierProvider<StateListNotifier, List<Place>>((
  ref,
) {
  return StateListNotifier();
});
