import 'package:flutter/material.dart';
import 'package:izobility_mobile/feature/wallet/ui/widgets/choose_coin_card.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:izobility_mobile/widgets/scaffold/home_scaffold.dart';

class ChooseCoinScreen extends StatefulWidget {
  const ChooseCoinScreen({super.key});

  @override
  State<ChooseCoinScreen> createState() => _ChooseCoinScreenState();
}

class _ChooseCoinScreenState extends State<ChooseCoinScreen> {
  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      appBar: CustomAppBar(
        context: context,
        text: "Coin",
        isBack: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        color: AppColors.purpleBcg,
        child: ListView.separated(
            itemCount: 20,
            separatorBuilder: (context, index) => const SizedBox(
                  height: 8,
                ),
            itemBuilder: (context, index) => const
                ChooseCoinCard(name: "Dick", coinPath: 'assets/icons/coin.svg')),
      ),
    );
  }
}
