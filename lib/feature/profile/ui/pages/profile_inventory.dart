import 'dart:ui';

import 'package:flutter/material.dart';


class DevelopingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DevelopingScreen'),
      ),
      body: Stack(
        children: [
          // Фон с размытием
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.green, Colors.white],
              ),
            ),
          ),
          // Содержимое экрана
          Center(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: Colors.transparent,
                child: Text(
                  'Экран в разработке',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
