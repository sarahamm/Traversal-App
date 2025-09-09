import 'package:favorite_places/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate {
  List<String> travelPlaces = [
    S().greece,
    S().france,
    S().japan,
    S().southAfrica,
    S().iceland,
    S().thailand,
    S().brazil,
    S().australia,
    S().jordan,
    S().italy,
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          travelPlaces.clear();
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  } // all about closing the widget by icon button

  @override
  Widget buildResults(BuildContext context) {
    final List<String> matchQuery = travelPlaces
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
          onTap: () {
            close(context, '');
          },
        );
      },
    );
  } //The results shown after the user submits a search from the search page.

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> matchQuery = travelPlaces
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(title: Text(result));
      },
    );
  }
}
