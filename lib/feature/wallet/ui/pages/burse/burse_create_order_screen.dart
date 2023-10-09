import 'package:flutter/material.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:izobility_mobile/widgets/scaffold/home_scaffold.dart';

class BurseCreateOrderScreen extends StatefulWidget {
  const BurseCreateOrderScreen({super.key});

  @override
  State<BurseCreateOrderScreen> createState() => _BurseCreateOrderScreenState();
}

class _BurseCreateOrderScreenState extends State<BurseCreateOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      appBar: CustomAppBar(
        context: context,
        text: "Создание заказа",
        isBack: false,
        onTap: () {},
      ),
      body: Container(
        
      ),
    );
  }
}
