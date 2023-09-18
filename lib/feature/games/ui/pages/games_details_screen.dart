import 'package:flutter/material.dart';
import 'package:izobility_mobile/models/game.dart';
import 'package:izobility_mobile/widgets/scaffold/home_scaffold.dart';

class GamesDetailsScreen extends StatefulWidget {
  final GameModel game;

  const GamesDetailsScreen({super.key, required this.game});

  @override
  State<GamesDetailsScreen> createState() => GamesDetailsScreenState();
}

class GamesDetailsScreenState extends State<GamesDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(),
    );
  }
}
