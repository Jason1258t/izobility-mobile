import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:izobility_mobile/widgets/scaffold/home_scaffold.dart';

class WalletAuthScreen extends StatefulWidget {
  const WalletAuthScreen({super.key});

  @override
  State<WalletAuthScreen> createState() => WwalletAuthScreenState();
}

class WwalletAuthScreenState extends State<WalletAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      appBar: CustomAppBar(
          context: context,
          isBack: true,
          text: "Кошелек",
          onTap: () {
            context.pop();
          }),
        body: Text('хуй'),
    );
  }
}
