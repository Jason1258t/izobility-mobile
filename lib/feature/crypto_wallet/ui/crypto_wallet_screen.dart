import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izobility_mobile/utils/colors.dart';
import 'package:izobility_mobile/utils/fonts.dart';
import 'package:izobility_mobile/widgets/icon_button/wallet_action.dart';
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

    return Scaffold(
      backgroundColor: AppColors.backgroundSecondary,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundSecondary,
        title: Text('Кошелёк монет',
            style: AppFonts.font16w700.copyWith(color: AppColors.textPrimary)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/monis.svg',
                          width: 40,
                          height: 40,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '14.76786',
                          style: AppFonts.font31w700
                              .copyWith(color: AppColors.textPrimary),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 12),
                      child: InkWell(
                        child: SvgPicture.asset(
                          'assets/icons/crossed_out_eye.svg',
                          color: Colors.black,
                          width: 30,
                          height: 30,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  'Текущий баланс',
                  style: AppFonts.font12w400
                      .copyWith(color: AppColors.textPrimary),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: WalletAction(
                          text: 'Внести',
                          assetName: 'assets/icons/straight_down_arrow.svg',
                          callback: () {},
                          height: (sizeOf.width - 116) / 4,
                          width: (sizeOf.width - 116) / 4,
                        )),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: WalletAction(
                          text: 'Вывести',
                          assetName: 'assets/icons/straight_up_arrow.svg',
                          callback: () {},
                          height: (sizeOf.width - 116) / 4,
                          width: (sizeOf.width - 116) / 4,
                        )),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: WalletAction(
                          text: 'Внести',
                          assetName: 'assets/icons/buy.svg',
                          callback: () {},
                          height: (sizeOf.width - 116) / 4,
                          width: (sizeOf.width - 116) / 4,
                        )),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: WalletAction(
                          text: 'Внести',
                          assetName: 'assets/icons/swap.svg',
                          callback: () {},
                          height: (sizeOf.width - 116) / 4,
                          width: (sizeOf.width - 116) / 4,
                        )),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
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
              ],
            ),
          ),
          if (tokenOrNft == 0) ...[
            _CustomSwitcher(
              activeTap: walletOrPlayer,
              onTap: (index) {
                walletOrPlayer = index;
                setState(() {});
              },
            ),
            if (walletOrPlayer == 0) ...[
              Expanded(
                child: Container(
                  width: sizeOf.width,
                  color: AppColors.backgroundContent,
                  child: SingleChildScrollView(
                    child: Column(
                        children: List.generate(
                            10,
                            (index) => ValidToken(
                                  title: '$index',
                                  subtitle: '$index',
                                  value: '$index',
                                  // imageUrl: '$index',
                                  onTap: () {},
                                ))),
                  ),
                ),
              ),
            ] else ...[
              Expanded(
                child: Container(
                  width: sizeOf.width,
                  color: AppColors.backgroundContent,
                  child: SingleChildScrollView(
                    child: Column(
                        children: List.generate(
                            10,
                            (index) => ValidToken(
                                  title: '$index',
                                  subtitle: '$index',
                                  value: '$index',
                                  // imageUrl: '$index',
                                  onTap: () {},
                                ))),
                  ),
                ),
              ),
            ]
          ] else ...[
            Container(
              width: 10,
              height: 10,
              color: AppColors.primary,
            )
          ]
        ],
      ),
    );
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
