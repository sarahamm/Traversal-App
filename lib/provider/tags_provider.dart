import 'package:favorite_places/models/tages_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//main class, that contain the main function to toggle the tags
class ToggleTagesNotifier extends StateNotifier<List<Tags>> {
  ToggleTagesNotifier() : super([]);

  void tagsToggle(Tags tag) {
    final isFavPlace = state.contains(tag);

    if (isFavPlace) {
      state = state.where((t) => t != tag).toList();
    } else {
      state = [...state, tag];
    }
  }

  void clear() {
    state = [];
  }
}

final usedTagsProvider = StateNotifierProvider<ToggleTagesNotifier, List<Tags>>(
  (ref) {
    return ToggleTagesNotifier();
  },
);
