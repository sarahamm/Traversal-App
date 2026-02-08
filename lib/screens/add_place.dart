// ignore_for_file: use_build_context_synchronously

import 'package:favorite_places/generated/l10n.dart';
//import 'package:favorite_places/provider/tags_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddPlace extends ConsumerStatefulWidget {
  const AddPlace({super.key});

  @override
  ConsumerState<AddPlace> createState() {
    return _AddPlaceState();
  }
}

class _AddPlaceState extends ConsumerState<AddPlace> {
  final _titleController = TextEditingController();
  final _subTitleController = TextEditingController();
  final _imageURLController = TextEditingController();
  final List<Map<String, Object?>> prefList = [];

  Future<void> _addFavouritePlace() async {
    final enteredPlace = _titleController.text;
    final enteredSudTitle = _subTitleController.text;
    final enteredImageUrl = _imageURLController.text;

    SharedPreferences pref = await SharedPreferences.getInstance();
    final prefPlaceTitle = await pref.setString("PlaceTitle", enteredPlace);
    final prefPlaceSubTitle = await pref.setString(
      "PlaceSubTitle",
      enteredSudTitle,
    );
    final prefPlaceImg = await pref.setString("PlaceImage", enteredImageUrl);

    prefList
        .map(
          (p) => p.addAll({
            enteredPlace: prefPlaceTitle,
            enteredSudTitle: prefPlaceSubTitle,
            enteredImageUrl: prefPlaceImg,
          }),
        )
        .toList();
    print("🟩the Pref List content : $prefList🟩");

    if (enteredPlace.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(S.of(context).fieldNotFilled)));
      return;
    } else {
      try {
      
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("$enteredPlace ${S.of(context).fieldFilled}")),
        );
        Navigator.of(context).pop();
      } 
      catch (error) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Error")));
        return;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    //final usedTags = ref.watch(usedTagsProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Add New Place')),

      body: Padding(
        padding: EdgeInsetsGeometry.all(18.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(label: Text('Tilte')),
              controller: _titleController,
            ),
            TextField(
              decoration: InputDecoration(label: Text('SubTilte')),
              controller: _subTitleController,
            ),
            TextField(
              decoration: InputDecoration(label: Text('Image URl')),
              controller: _imageURLController,
            ),
/*
            Wrap(
              spacing: 8,
              children: usedTags.map((tag) {
                return ActionChip(
                  label: Text('Tags : '),
                  onPressed: () =>
                      ref.read(usedTagsProvider.notifier).tagsToggle(tag),
                  backgroundColor: Colors.green[200],
                );
              }).toList(),
            ),
            Wrap(
              spacing: 8,
              children: usedTags.map((tag) {
                return ActionChip(
                  label: Text('Tags : '),
                  onPressed: () =>
                      ref.read(usedTagsProvider.notifier).tagsToggle(tag),
                  backgroundColor: Colors.grey[200],
                );
              }).toList(),
            ),
*/
            SizedBox(height: 32.0),
            ElevatedButton.icon(
              onPressed: _addFavouritePlace,
              icon: Icon(
                Icons.add,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              label: Text('Add Place'),
            ),
          ],
        ),
      ),
    );
  }
}
