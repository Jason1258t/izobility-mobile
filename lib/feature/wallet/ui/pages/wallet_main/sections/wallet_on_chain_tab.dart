import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/feature/wallet/bloc/coin_in_wallet/coin_in_wallet_cubit.dart';
import 'package:izobility_mobile/feature/wallet/data/wallet_repository.dart';
import 'package:izobility_mobile/feature/wallet/ui/pages/wallet_main/sections/on_chain_tokens.dart';
import 'package:izobility_mobile/feature/wallet/ui/widgets/tab_bar.dart';
import 'package:izobility_mobile/feature/wallet/ui/widgets/wallet_action.dart';
import 'package:izobility_mobile/localization/app_localizations.dart';
import 'package:izobility_mobile/routes/go_routes.dart';
import 'package:izobility_mobile/utils/logic/constants.dart';
import 'package:izobility_mobile/utils/utils.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_sliver_app_bar_delegate.dart';
import 'package:izobility_mobile/widgets/containers/valid_token.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:url_launcher/url_launcher.dart';

class WalletOnChainTab extends StatefulWidget {
  const WalletOnChainTab(
      {super.key,
      required this.sizeOf,
      required this.tabController,
      required this.tokenOrNft,
      required this.onTabTapped});

  final Size sizeOf;
  final TabController tabController;
  final int tokenOrNft;
  final Function(int) onTabTapped;

  @override
  State<WalletOnChainTab> createState() => _WalletOnChainTabState();
}

class _WalletOnChainTabState extends State<WalletOnChainTab> {
  @override
  Widget build(BuildContext context) {

    WalletRepository walletRepository =
        RepositoryProvider.of<WalletRepository>(context);

    final localize = AppLocalizations.of(context)!;

    List<Widget> getOnChainCoins() => walletRepository.coinsInChain
        .map((item) => ValidToken(
              title: item.name,
              value: double.parse(item.rubleExchangeRate).toStringAsFixed(2),
              onTap: () {
                context.push(RouteNames.walletCurrency,
                    extra: {'token_data': item, 'in_game_or_on_chain': false});
              },
              imageUrl: item.imageUrl,
              prise: walletRepository.obscured
                  ? AppStrings.obscuredText
                  : item.amount,
              increment: '0,02',
              usdValue: walletRepository.obscured
                  ? AppStrings.obscuredText
                  : '${(double.parse(item.amount) * double.parse(item.rubleExchangeRate)).toStringAsFixed(2)} \$',
            ))
        .toList();

    return MultiSliver(
      children: [
        SliverPersistentHeader(
          pinned: true,
          floating: false,
          delegate: SliverAppBarDelegate(
            minHeight: 43,
            maxHeight: 43,
            child: Container(
              color: Colors.white,
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  setState(() {
                    walletRepository.setObscured(!walletRepository.obscured);
                  });
                },
                child: BlocBuilder<CoinInWalletCubit, CoinInWalletState>(
                  builder: (context, state) {
                    if (state is CoinInWalletLoadedSuccessState) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                              walletRepository.obscured
                                  ? AppStrings.obscuredText
                                  : walletRepository.emeraldInWalletBalance
                                      .toString(),
                              style: AppTypography.font36w700.copyWith(
                                  color: AppColors.textPrimary, height: 1)),
                          const SizedBox(
                            width: 10,
                          ),
                          Image.network("https://api.z-boom.ru/media/" +
                              "moneta/22aca8bb1a77d571aff193a7dcb6d2d1.jpg"),
                        ],
                      );
                    } else if (state is CoinInWalletLoadingState) {
                      return const CircularProgressIndicator();
                    }

                    return Container();
                  },
                ),
              ),
            ),
          ),
        ),
        SliverPersistentHeader(
          pinned: true,
          floating: true,
          delegate: SliverAppBarDelegate(
            minHeight: widget.sizeOf.width * 0.156 + 40,
            maxHeight: widget.sizeOf.width * 0.156 + 40,
            child: Container(
              color: Colors.white,
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    WalletAction(
                      title: localize.send,
                      icon: 'assets/icons/send.svg',
                      onTap: () {
                        context.push(RouteNames.walletChooseCoin,
                            extra: {'path': 'send_in_game_coin_currency'});
                      },
                    ),
                    WalletAction(
                      title: localize.replenish,
                      icon: 'assets/icons/get.svg',
                      onTap: () {
                        context.push(RouteNames.walletChooseCoin,
                            extra: {'path': 'replenish'});
                      },
                    ),
                    // WalletAction(
                    //   title: localize.buy,
                    //   icon: 'assets/icons/buy.svg',
                    //   onTap: () {
                    //     // context
                    //     //     .push('${RouteNames.walletChooseCoin}/buy');
                    //   },
                    // ),
                    WalletAction(
                      title: "Биржа",
                      icon: 'assets/icons/burse.svg',
                      onTap: () {
                        launchUrl(Uri.parse('https://altcoinshub.com/en/'));
                      },
                    ),
                    WalletAction(
                      title: localize.swap,
                      icon: 'assets/icons/transfer_arrows_bold.svg',
                      onTap: () {},
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
        WalletTabBarTokensOrNFT(
          onTabTapped: widget.onTabTapped,
          tabController: widget.tabController,
        ),
        CupertinoSliverRefreshControl(
          key: const ValueKey(2),
          onRefresh: () async {
            await walletRepository.getOnChainCoinsData();
            await walletRepository.getUserEmeraldBill();
          },
        ),
        SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: widget.tokenOrNft == 0
                ? OnChainTokens(tokens: getOnChainCoins())
                : const SliverToBoxAdapter(
                    child: Text(
                      'Еще нету контрактов',
                      textAlign: TextAlign.center,
                    ),
                  )),
      ],
    );
  }
}
