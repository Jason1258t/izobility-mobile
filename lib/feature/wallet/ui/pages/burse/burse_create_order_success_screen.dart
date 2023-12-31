import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/localization/app_localizations.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/utils/ui/fonts.dart';
import 'package:izobility_mobile/utils/ui/gradients.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:izobility_mobile/widgets/button/custom_button.dart';
import 'package:izobility_mobile/widgets/scaffold/wallet_scaffold.dart';

class BurseCreateOrderSuccessScreen extends StatefulWidget {
  const BurseCreateOrderSuccessScreen({super.key});

  @override
  State<BurseCreateOrderSuccessScreen> createState() =>
      _BurseCreateOrderSuccessScreenState();
}

class _BurseCreateOrderSuccessScreenState
    extends State<BurseCreateOrderSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    final localize = AppLocalizations.of(context)!;

    return WalletScaffold(
      appBar: CustomAppBar(
        context: context,
        text: localize.creating_order,
        isBack: true,
        onTap: () {
          context.pop();
        },
      ),
      onTap: () {},
      scaffoldColor: AppColors.purpleBcg,
      backgroundColor: Colors.white,
      body: Container(
          color: AppColors.purpleBcg,
          padding: const EdgeInsets.all(16),
          child: buildCreateOrderSuccessWidget()),
    );
  }

  Widget buildCreateOrderSuccessWidget() {
    final localize = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          decoration: BoxDecoration(
              gradient: AppGradients.gradientGreenDark,
              borderRadius: BorderRadius.circular(16)),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/celebrate.png",
                width: 64,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                localize.congratulations_your_place_order,
                textAlign: TextAlign.center,
                style: AppTypography.font18w700.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        CustomButton(
            text: localize.on_exchange,
            onTap: () {
              context.pop();
              context.pop();
            },
            width: double.infinity)
      ],
    );
  }
}
