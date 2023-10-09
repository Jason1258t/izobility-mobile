import 'package:flutter/material.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:izobility_mobile/widgets/scaffold/home_scaffold.dart';

class BurseScreen extends StatefulWidget {
  const BurseScreen({super.key});

  @override
  State<BurseScreen> createState() => _BurseScreenState();
}

class _BurseScreenState extends State<BurseScreen> {
  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      appBar: CustomAppBar(
        context: context,
        text: "Биржа",
        actions: [
          Icon(Icons.history_toggle_off_rounded, size: 25, color: Colors.black,)
        ],
        isBack: false,
        onTap: () {},
      ),
      body: Container(

      ),
    );
  }
}
