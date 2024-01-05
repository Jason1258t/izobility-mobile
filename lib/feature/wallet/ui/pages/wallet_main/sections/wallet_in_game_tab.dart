import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/feature/wallet/bloc/coin_in_game/coin_in_game_cubit.dart';
import 'package:izobility_mobile/feature/wallet/data/wallet_repository.dart';
import 'package:izobility_mobile/feature/wallet/ui/widgets/tab_bar.dart';
import 'package:izobility_mobile/feature/wallet/ui/widgets/wallet_action.dart';
import 'package:izobility_mobile/localization/app_localizations.dart';
import 'package:izobility_mobile/routes/go_routes.dart';
import 'package:izobility_mobile/utils/logic/constants.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/utils/ui/fonts.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_sliver_app_bar_delegate.dart';
import 'package:izobility_mobile/widgets/containers/valid_token.dart';
import 'package:sliver_tools/sliver_tools.dart';

import 'in_game_tokens.dart';

class WalletInGameTab extends StatefulWidget {
  const WalletInGameTab(
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
  State<WalletInGameTab> createState() => _WalletInGameTabState();
}

class _WalletInGameTabState extends State<WalletInGameTab> {
  @override
  Widget build(BuildContext context) {
    WalletRepository walletRepository =
        RepositoryProvider.of<WalletRepository>(context);
    final localize = AppLocalizations.of(context)!;

    List<Widget> getInGameCoins() => walletRepository.coinsInGame
        .map((item) => ValidToken(
              title: item.name,
              value: double.parse(item.rubleExchangeRate).toStringAsFixed(2),
              onTap: () {
                context.push(RouteNames.walletCurrency,
                    extra: {'token_data': item, 'in_game_or_on_chain': true});
                walletRepository.getCoinOperations(item.address ?? "");
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
                child: BlocBuilder<CoinInGameCubit, CoinInGameState>(
                  builder: (context, state) {
                    if (state is CoinInGameSuccess) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                              walletRepository.obscured
                                  ? AppStrings.obscuredText
                                  : walletRepository.emeraldInGameBalance
                                      .toString(),
                              style: AppTypography.font36w700.copyWith(
                                  color: AppColors.textPrimary, height: 1)),
                          const SizedBox(
                            width: 10,
                          ),
                          Image.network(AppStrings.emeraldIconUrl),
                        ],
                      );
                    } else if (state is CoinInGameLoading) {
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
                            extra: {'path': 'send_on_chain_coin_currency'});
                      },
                    ),
                    // WalletAction(
                    //   title: localize.replenish,
                    //   icon: 'assets/icons/get.svg',
                    //   onTap: () {
                    //     // context.push(
                    //     //     '${RouteNames.walletChooseCoin}/replenish');
                    //   },
                    // ),
                    WalletAction(
                      title: localize.exchange,
                      icon: 'assets/icons/burse.svg',
                      onTap: () {
                        context.push(RouteNames.walletBurse);
                      },
                    ),
                    WalletAction(
                      title: localize.swap,
                      icon: 'assets/icons/transfer_arrows_bold.svg',
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
        WalletTabBarTokensOrNFT(
            tabController: widget.tabController,
            onTabTapped: widget.onTabTapped),
        CupertinoSliverRefreshControl(
          key: const ValueKey(0),
          onRefresh: () async {
            // await context.read() // TODO implemetn z boom loading process
            await context.read<WalletRepository>().getGameTokens();
          },
        ),
        SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: widget.tokenOrNft == 0
                ? InGameTokens(tokens: getInGameCoins())
                : const SliverToBoxAdapter(child: Text("in developing"))),
      ],
    );
  }
}
