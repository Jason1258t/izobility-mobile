import 'package:flutter/material.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:izobility_mobile/widgets/scaffold/home_scaffold.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: SingleChildScrollView(
            child: Column(children: [
          Row(
            children: [Text('asdf')],
          )
        ])),
      ),
      appBar: CustomAppBar(
        context: context,
        text: 'Магазин',
        isBack: false,
      ),
    );
  }
}
