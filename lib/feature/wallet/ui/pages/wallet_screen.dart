import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/feature/wallet/bloc/main_coin/main_coin_cubit.dart';
import 'package:izobility_mobile/feature/wallet/data/wallet_repository.dart';
import 'package:izobility_mobile/routes/go_routes.dart';
import 'package:izobility_mobile/utils/logic/constants.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_sliver_app_bar.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_sliver_app_bar_delegate.dart';
import 'package:izobility_mobile/feature/wallet/ui/widgets/wallet_action.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/utils/ui/fonts.dart';
import 'package:izobility_mobile/widgets/containers/valid_token.dart';
import 'package:izobility_mobile/widgets/switches/custom_switcher.dart';

import '../../../../widgets/containers/market_Item.dart';

final list = List.generate(100, (index) => 1);

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen>
    with SingleTickerProviderStateMixin {
  int tokenOrNft = 0;

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);

    final walletRepository = RepositoryProvider.of<WalletRepository>(context);

    return Container(
      color: AppColors.purple200,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.purpleBcg,
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(
                decelerationRate: ScrollDecelerationRate.fast),
            slivers: [
              CustomSliverAppBar(
                height: 90,
                isBack: false,
                title: 'Кошелек',
                color: AppColors.purple200,
                isSetting: true,
                isInfo: true,
                onTapRightIcon: () {
                  context.push(RouteNames.walletSetting);
                },
              ),
              SliverPersistentHeader(
                pinned: false,
                floating: true,
                delegate: SliverAppBarDelegate(
                  minHeight: 98,
                  maxHeight: 98,
                  child: Container(
                    color: AppColors.purple200,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomSwitcher(
                            active: walletRepository.walletPage,
                            onTap: (int val) {
                              // setState(() {
                              //   walletRepository.setWalletPage(val);
                              // });
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Текущий баланс',
                            style: AppTypography.font14w400
                                .copyWith(color: AppColors.blackGraySecondary),
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
                  minHeight: 43,
                  maxHeight: 43,
                  child: Container(
                    color: AppColors.purple200,
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          walletRepository
                              .setObscured(!walletRepository.obscured);
                        });
                      },
                      child: BlocBuilder<MainCoinCubit, MainCoinState>(
                        builder: (context, state) {
                          if (state is MainCoinSuccess) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                    walletRepository.obscured
                                        ? AppStrings.obscuredText
                                        : walletRepository.emeraldCoin
                                            .toString(),
                                    style: AppTypography.font36w700.copyWith(
                                        color: AppColors.textPrimary,
                                        height: 1)),
                                const SizedBox(
                                  width: 10,
                                ),
                                Image.asset(
                                  'assets/images/emerald_coin.png',
                                ),
                              ],
                            );
                          } else if (state is MainCoinLoading) {
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
                  minHeight: sizeOf.width * 0.156 + 40,
                  maxHeight: sizeOf.width * 0.156 + 40,
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
                              context.push(
                                  '${RouteNames.walletChooseCoin}/send_currency');
                            },
                          ),
                          WalletAction(
                            title: 'Пополнить',
                            icon: 'assets/icons/get.svg',
                            onTap: () {
                              context.push(
                                  '${RouteNames.walletChooseCoin}/replenish');
                            },
                          ),
                          WalletAction(
                            title: 'Купить',
                            icon: 'assets/icons/buy.svg',
                            onTap: () {
                              context
                                  .push('${RouteNames.walletChooseCoin}/buy');
                            },
                          ),
                          WalletAction(
                            title: 'Своп',
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
              SliverPersistentHeader(
                pinned: true,
                floating: false,
                delegate: SliverAppBarDelegate(
                  minHeight: 60,
                  maxHeight: 60,
                  child: Container(
                    color: AppColors.purpleBcg,
                    alignment: Alignment.center,
                    child: TabBar(
                      labelColor: AppColors.textPrimary,
                      indicatorColor: AppColors.textPrimary,
                      indicatorWeight: 2,
                      indicator: const UnderlineTabIndicator(
                          borderSide: BorderSide(
                              color: AppColors.textPrimary, width: 2),
                          insets: EdgeInsets.symmetric(horizontal: -40)),
                      onTap: (int val) {
                        setState(() {
                          tokenOrNft = val;
                        });
                      },
                      controller: _tabController,
                      tabs: const [
                        Tab(
                          text: 'Токены',
                        ),
                        Tab(text: 'NFT'),
                      ],
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: tokenOrNft == 0
                    ? SliverList(
                        delegate: SliverChildListDelegate(
                            RepositoryProvider.of<WalletRepository>(context)
                                .gameTokens
                                .map((item) => ValidToken(
                                      title: item.name,
                                      value:
                                          double.parse(item.rubleExchangeRate)
                                              .toStringAsFixed(2),
                                      onTap: () {
                                        context.push(RouteNames.walletCurrency);
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
                                .toList()),
                      )
                    : SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) => MarketItem(
                            imageUrl:
                                'https://kartinkin.net/uploads/posts/2022-08/1661214768_6-kartinkin-net-p-burger-king-chiken-barbekyu-vkontakte-11.jpg',
                            textDescription:
                                'Набор бонусов для игры Reapers rush +156 к мощности',
                            isNew: true,
                            pizdulkaUrl: '',
                            onTap: () {},
                            coinData: const [],
                          ),
                          childCount: 12,
                        ),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            crossAxisSpacing: 8,
                            maxCrossAxisExtent:
                                (MediaQuery.of(context).size.width - 40) / 2,
                            childAspectRatio: 160 / 229)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
