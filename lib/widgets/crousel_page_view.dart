import 'package:flutter/material.dart';

class CrouselPageViewWidghet extends StatefulWidget {
  const CrouselPageViewWidghet({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CrouselPageViewState();
  }
}

class _CrouselPageViewState extends State<CrouselPageViewWidghet> {
  final List<String> images = [
    'assets/adventure.jpg',
    'assets/greece.jpg',
    'assets/south_africa.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.0,
      child: PageView.builder(
        controller: PageController(),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsetsGeometry.all(4),
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(16),
              child: Image.asset(images[index], fit: BoxFit.cover),
            ),
          );
        },
      ),
    );
  }
}
