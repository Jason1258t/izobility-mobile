import 'package:flutter/material.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:izobility_mobile/widgets/scaffold/home_scaffold.dart';

class BurseHistoryScreen extends StatefulWidget {
  const BurseHistoryScreen({super.key});

  @override
  State<BurseHistoryScreen> createState() => _BurseHistoryScreenState();
}

class _BurseHistoryScreenState extends State<BurseHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      appBar: CustomAppBar(
        context: context,
        text: "Покупка заказа",
        isBack: false,
        onTap: () {},
      ),
      body: Container(
        
      ),
    );
  }
}
