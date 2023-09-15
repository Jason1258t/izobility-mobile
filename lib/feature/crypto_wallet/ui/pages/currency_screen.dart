import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_sliver_app_bar.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_sliver_app_bar_delegate.dart';
import 'package:izobility_mobile/feature/crypto_wallet/ui/widgets/wallet_action.dart';
import 'package:izobility_mobile/utils/colors.dart';
import 'package:izobility_mobile/utils/fonts.dart';
import 'package:izobility_mobile/widgets/containers/valid_token.dart';

final list = List.generate(100, (index) => 1);

class CurrencyWalletScreen extends StatefulWidget {
  const CurrencyWalletScreen({super.key});

  @override
  State<CurrencyWalletScreen> createState() => _CurrencyWalletScreenState();
}

class _CurrencyWalletScreenState extends State<CurrencyWalletScreen> {
  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);

    return Container(
      color: AppColors.purple100,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.purpleBcg,
          body: CustomScrollView(
            slivers: [
              const CustomSliverAppBar(
                height: 90,
                isBack: true,
                title: 'Usd',
              ),
              SliverPersistentHeader(
                pinned: true,
                floating: false,
                delegate: SliverAppBarDelegate(
                  minHeight: 115,
                  maxHeight: 115,
                  child: Container(
                    color: AppColors.purple100,
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        const CircleAvatar(
                          radius: 20,
                          backgroundColor: AppColors.primary,
                        ),
                        Text('123 123\$',
                            style: AppFonts.font36w700
                                .copyWith(color: AppColors.textPrimary)),
                        Text(
                          '≈ 2,545 \$',
                          style: AppFonts.font16w400
                              .copyWith(color: AppColors.blackGraySecondary),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                floating: true,
                delegate: SliverAppBarDelegate(
                  minHeight: sizeOf.width * 0.078 + 75,
                  maxHeight: sizeOf.width * 0.078 + 75,
                  child: Container(
                    color: AppColors.purple100,
                    alignment: Alignment.center,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 16, right: 16, top: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          WalletAction(
                            title: 'asdf',
                            icon: SvgPicture.asset(
                              'assets/icons/send.svg',
                              width: sizeOf.width * 0.067,
                              height: sizeOf.width * 0.067,
                            ),
                          ),
                          WalletAction(
                            title: 'asdf',
                            icon: SvgPicture.asset(
                              'assets/icons/send.svg',
                              width: sizeOf.width * 0.067,
                              height: sizeOf.width * 0.067,
                            ),
                          ),
                          WalletAction(
                            title: 'asdf',
                            icon: SvgPicture.asset(
                              'assets/icons/send.svg',
                              width: sizeOf.width * 0.067,
                              height: sizeOf.width * 0.067,
                            ),
                          ),
                          WalletAction(
                            title: 'asdf',
                            icon: SvgPicture.asset(
                              'assets/icons/send.svg',
                              width: sizeOf.width * 0.067,
                              height: sizeOf.width * 0.067,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                floating: false,
                delegate: SliverAppBarDelegate(
                  minHeight: 17,
                  maxHeight: 17,
                  child: Container(
                    height: 18,
                    decoration: const BoxDecoration(
                        color: AppColors.purple100,
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(16))),
                  ),
                ),
              ),
              SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(list
                        .map((item) => ValidToken(
                              title: 'Protocol',
                              value: '211,12',
                              onTap: () {},
                              prise: '0,29',
                              increment: '0,02',
                              usdValue: '0,0021',
                            ))
                        .toList()),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}