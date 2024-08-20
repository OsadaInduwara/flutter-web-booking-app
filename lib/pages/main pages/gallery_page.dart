import 'package:flutter/material.dart';

import '../../widgets/footer.dart';


class GalleryPage extends StatelessWidget {
  final List<String> images = [
    'images/event1.png',
    'images/event2.png',
    'images/event3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderSection(),
            GalleryGrid(images: images),
            Footer(),
          ],
        ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.0),
      color: Colors.blueAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Gallery',
            style: TextStyle(fontSize: 32, color: Colors.white),
          ),
          SizedBox(height: 8),
          Text(
            'Our recent events in pictures.',
            style: TextStyle(fontSize: 18, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

class GalleryGrid extends StatelessWidget {
  final List<String> images;

  GalleryGrid({required this.images});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Image.asset(images[index]);
        },
      ),
    );
  }
}
