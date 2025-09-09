// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:flutter/material.dart';

class Tags {
  final tag_model;
  Tags({required this.tag_model});
}

class TagsMap {
  final List<Map<String, dynamic>> tagesMap = [
    {'title': 'Visited', 'icon': Icons.checklist_rounded, 'bool': false},

    {
      'title': 'Favourite Places',
      'icon': Icon(Icons.star_rate_rounded),
      'bool': false,
    },

    {
      'title': 'Want To Visit',
      'icon': Icon(Icons.not_listed_location_rounded),
      'bool': false,
    },

    {
      'title': 'Planned',
      'icon': Icon(Icons.photo_album_rounded),
      'bool': false,
    },
  ];
}

final List<Map<String, Icon>> flagsMap = [
  {"Adventure": Icon(Icons.explore)},
  {"Discover New Culture": Icon(Icons.travel_explore_rounded)},
  {"Vacation": Icon(Icons.beach_access_rounded)},
  {"Job Trip": Icon(Icons.work_rounded)},
];
