import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izobility_mobile/utils/colors.dart';
import 'package:izobility_mobile/utils/fonts.dart';
import 'package:izobility_mobile/widgets/icon_button/wallet_action.dart';
import 'package:izobility_mobile/widgets/scaffold/home_scaffold.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../widgets/containers/valid_token.dart';

class CryptoWalletScreen extends StatefulWidget {
  const CryptoWalletScreen({super.key});

  @override
  State<CryptoWalletScreen> createState() => _CryptoWalletScreenState();
}

class _CryptoWalletScreenState extends State<CryptoWalletScreen> {
  int tokenOrNft = 0;
  int walletOrPlayer = 0;

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);

    return HomeScaffold(
        backgroundColor: AppColors.purple100,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: AppColors.purple100,
          surfaceTintColor: Colors.transparent,
          title: Text('Кошелёк монет',
              style:
                  AppFonts.font16w700.copyWith(color: AppColors.textPrimary)),
        ),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: AppColors.purple100,
              title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ToggleSwitch(
                    minWidth: double.infinity,
                    minHeight: 45,
                    cornerRadius: 100,
                    borderWidth: 2,
                    borderColor: const [AppColors.border],
                    activeBgColors: const [
                      [AppColors.backgroundContent],
                      [AppColors.backgroundContent],
                    ],
                    activeFgColor: AppColors.textPrimary,
                    inactiveBgColor: AppColors.backgroundSecondary,
                    initialLabelIndex: tokenOrNft,
                    totalSwitches: 2,
                    labels: const ['Токены', 'NFT'],
                    radiusStyle: true,
                    onToggle: (index) {
                      tokenOrNft = index!;
                      setState(() {});
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Текущий баланс',
                    style: AppFonts.font14w400
                        .copyWith(color: AppColors.blackGraySecondary),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class _CustomSwitcher extends StatelessWidget {
  const _CustomSwitcher(
      {super.key, required this.onTap, required this.activeTap});

  final Function(int) onTap;
  final int activeTap;

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);

    return Row(
      children: [
        InkWell(
          onTap: () {
            onTap(0);
          },
          child: Container(
            width: sizeOf.width / 2,
            height: 36,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: activeTap == 0
                  ? AppColors.backgroundContent
                  : Colors.transparent,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Text(
              'Кошелек',
              style: AppFonts.font16w400.copyWith(
                  color: activeTap == 0
                      ? AppColors.primary
                      : AppColors.textTertiary),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            onTap(1);
          },
          child: Container(
            width: sizeOf.width / 2,
            height: 36,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: activeTap == 1
                  ? AppColors.backgroundContent
                  : Colors.transparent,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Text(
              'Игровые',
              style: AppFonts.font16w400.copyWith(
                  color: activeTap == 1
                      ? AppColors.primary
                      : AppColors.textTertiary),
            ),
          ),
        ),
      ],
    );
  }
}
