import 'package:flutter/material.dart';

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({super.key});

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  final PageController _controller = PageController();
  int currentPage = 0;

  final List<String> images = [
    'assets/adventure.jpg',
    'assets/thailand.jpg',
    'assets/south_africa.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Carousel
        SizedBox(
          height: 220,
          child: PageView.builder(
            controller: _controller,
            itemCount: images.length,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(images[index], fit: BoxFit.cover),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 10),

        // Dots indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            images.length,
            (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: currentPage == index ? 10 : 6,
              height: currentPage == index ? 10 : 6,
              decoration: BoxDecoration(
                color: currentPage == index
                    ? Colors.grey[700]
                    : Colors.grey[400],
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
