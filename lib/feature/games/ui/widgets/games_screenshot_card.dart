import 'package:flutter/material.dart';

class GamesScreenshotCard extends StatefulWidget {
  final String imagePath;

  const GamesScreenshotCard({super.key, required this.imagePath});

  @override
  State<GamesScreenshotCard> createState() => GamesScreenshotCardState();
}

class GamesScreenshotCardState extends State<GamesScreenshotCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 144,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(widget.imagePath))),
    );
  }
}
