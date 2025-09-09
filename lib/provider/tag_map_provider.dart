import 'package:favorite_places/models/places_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum TagElement { visited, favourite, wantToVisit, planned }

final placeDataProvider = Provider((ref) {
  return placesData;
});

final tagProvider =
    StateNotifierProvider<TagMapNotifier, Map<TagElement, bool>>(
      (ref) => TagMapNotifier(),
    );

class TagMapNotifier extends StateNotifier<Map<TagElement, bool>> {
  TagMapNotifier()
    : super({
        TagElement.visited: false,
        TagElement.favourite: false,
        TagElement.wantToVisit: false,
        TagElement.planned: false,
      });

  void setTags(Map<TagElement, bool> isChosen) {
    state = isChosen;
  }

  void setTag(TagElement tag, bool isSelected) {
    state = {...state, tag: isSelected};
  }

  final tagToggleProvider = Provider((ref) {
    final tag = ref.watch(placeDataProvider);
    final activeTag = ref.watch(tagProvider);

    return tag.where((tg) {
      if (activeTag[TagElement.visited]! && !tg.tags!.contains('Visited')) {
        return false;
      }
      if (activeTag[TagElement.favourite]! && !tg.tags!.contains('Favorite')) {
        return false;
      }
      if (activeTag[TagElement.wantToVisit]! &&
          !tg.tags!.contains('Want to Visit')) {
        return false;
      }
      if (activeTag[TagElement.planned]! && !tg.tags!.contains('Planned')) {
        return false;
      }
      return true;
    }).toList();
  });
}
