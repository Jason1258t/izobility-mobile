import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/feature/wallet/data/wallet_repository.dart';
import 'package:izobility_mobile/localization/app_localizations.dart';
import 'package:izobility_mobile/models/api/token_data.dart';
import 'package:izobility_mobile/routes/go_routes.dart';
import 'package:izobility_mobile/utils/logic/constants.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_sliver_app_bar.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_sliver_app_bar_delegate.dart';
import 'package:izobility_mobile/feature/wallet/ui/widgets/wallet_action.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/utils/ui/fonts.dart';

final list = List.generate(100, (index) => 1);

class CurrencyWalletScreen extends StatefulWidget {
  const CurrencyWalletScreen(
      {super.key, required this.token, required this.inGameOrOrChain});

  final TokenData token;
  final bool inGameOrOrChain;

  @override
  State<CurrencyWalletScreen> createState() => _CurrencyWalletScreenState();
}

class _CurrencyWalletScreenState extends State<CurrencyWalletScreen> {
  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);

    final walletRepository = context.read<WalletRepository>();

    final localize = AppLocalizations.of(context)!;

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.purpleBcg,
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(
                decelerationRate: ScrollDecelerationRate.fast),
            slivers: [
              CustomSliverAppBar(
                height: 90,
                isBack: true,
                title: widget.token.name,
                color: Colors.white,
                isInfo: true,
                onTapRightIcon: () {
                  context.push(RouteNames.walletInfoCurrency,
                      extra: widget.token);
                },
              ),
              SliverPersistentHeader(
                pinned: true,
                floating: false,
                delegate: SliverAppBarDelegate(
                  minHeight: 115,
                  maxHeight: 115,
                  child: Container(
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                image: DecorationImage(
                                    image:
                                        NetworkImage(widget.token.imageUrl))),
                          ),
                        ),
                        Text(
                            walletRepository.obscured
                                ? AppStrings.obscuredText
                                : widget.token.amount,
                            style: AppTypography.font36w700
                                .copyWith(color: AppColors.textPrimary)),
                        Text(
                          walletRepository.obscured
                              ? AppStrings.obscuredText
                              : '≈ ${widget.token.rubleExchangeRate} ₽',
                          style: AppTypography.font16w400
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
                  minHeight: sizeOf.width * 0.156 + 40,
                  maxHeight: sizeOf.width * 0.156 + 40,
                  child: Container(
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 16, right: 16, top: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          WalletAction(
                            title: localize.send,
                            icon: 'assets/icons/send.svg',
                            onTap: () {
                              context.push(
                                  widget.inGameOrOrChain
                                      ? RouteNames.walletSendInGameCoin
                                      : RouteNames.walletSendOnChainCoin,
                                  extra: widget.token);
                            },
                          ),
                          !widget.inGameOrOrChain ? WalletAction(
                            title: localize.replenish,
                            icon: 'assets/icons/get.svg',
                            onTap: () {
                              context.push(RouteNames.walletReplenish);
                            },
                          ) : Container(),
                          // WalletAction(
                          //   title: localize.buy,
                          //   icon: 'assets/icons/buy.svg',
                          //   onTap: () {
                          //     context.push(RouteNames.walletBuyCurrency);
                          //   },
                          // ),
                          WalletAction(
                            title: localize.swap,
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
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(16))),
                  ),
                ),
              ),
              const SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      'нету перевода у этой монете',
                      textAlign: TextAlign.center,
                    ),
                  )
                  // SliverList(
                  //   delegate: SliverChildListDelegate(list
                  //       .map((item) => WalletTransactionContainer(
                  //             title: 'Перевод',
                  //             onTap: () {},
                  //             prise: walletRepository.obscured ? AppStrings.obscuredText :'+ 0,29 USDT',
                  //             address: 'asdfasdfasdf',
                  //             isAddition: true,
                  //           ))
                  //       .toList()),
                  // )
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
