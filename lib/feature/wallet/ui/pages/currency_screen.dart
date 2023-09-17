import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/feature/wallet/ui/widgets/transaction_container.dart';
import 'package:izobility_mobile/routes/route_names.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_sliver_app_bar.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_sliver_app_bar_delegate.dart';
import 'package:izobility_mobile/feature/wallet/ui/widgets/wallet_action.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/utils/ui/fonts.dart';

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
      color: AppColors.purple200,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.purpleBcg,
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(
                decelerationRate: ScrollDecelerationRate.fast),
            slivers: [
              const CustomSliverAppBar(
                height: 90,
                isBack: true,
                title: 'Usd',
                color: AppColors.purple200,
              ),
              SliverPersistentHeader(
                pinned: true,
                floating: false,
                delegate: SliverAppBarDelegate(
                  minHeight: 115,
                  maxHeight: 115,
                  child: Container(
                    color: AppColors.purple200,
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
                    color: AppColors.purple200,
                    alignment: Alignment.center,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 16, right: 16, top: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          WalletAction(
                            title: 'Отправить',
                            icon: 'assets/icons/send.svg',
                            onTap: () {
                              context.push(RouteNames.walletSendCurrency);
                            },
                          ),
                          WalletAction(
                            title: 'Пополнить',
                            icon: 'assets/icons/get.svg',
                            onTap: () {
                              context.push(RouteNames.walletReplenish);
                            },
                          ),
                          WalletAction(
                            title: 'Купить',
                            icon: 'assets/icons/buy.svg',
                            onTap: () {
                              context.push(RouteNames.walletBuyCurrency);
                            },
                          ),
                          WalletAction(
                            title: 'Своп ',
                            icon: 'assets/icons/swap.svg',
                            onTap: () {
                              context.push(RouteNames.walletSwap);
                            },
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
                        color: AppColors.purple200,
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(16))),
                  ),
                ),
              ),
              SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(list
                        .map((item) => TransactionContainer(
                              title: 'Перевод',
                              onTap: () {},
                              prise: '0,29',
                              address: 'asdfasdfasdf',
                              isAddition: true,
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