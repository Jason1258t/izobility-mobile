import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_sliver_app_bar.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_sliver_app_bar_delegate.dart';
import 'package:izobility_mobile/feature/crypto_wallet/ui/widgets/wallet_action.dart';
import 'package:izobility_mobile/utils/colors.dart';
import 'package:izobility_mobile/utils/fonts.dart';
import 'package:izobility_mobile/utils/route_names.dart';
import 'package:izobility_mobile/widgets/containers/valid_token.dart';
import 'package:izobility_mobile/widgets/switches/custom_switcher.dart';

import '../../../../widgets/containers/market_Item.dart';

final list = List.generate(100, (index) => 1);

class CryptoWalletScreen extends StatefulWidget {
  const CryptoWalletScreen({super.key});

  @override
  State<CryptoWalletScreen> createState() => _CryptoWalletScreenState();
}

class _CryptoWalletScreenState extends State<CryptoWalletScreen>
    with SingleTickerProviderStateMixin {
  int tokenOrNft = 0;
  int walletOrPlayer = 0;

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

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
                isBack: false,
                title: 'Кошелек',
              ),
              SliverPersistentHeader(
                pinned: false,
                floating: true,
                delegate: SliverAppBarDelegate(
                  minHeight: 98,
                  maxHeight: 98,
                  child: Container(
                    color: AppColors.purple100,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomSwitcher(
                            active: walletOrPlayer,
                            onTap: (int val) {
                              setState(() {
                                walletOrPlayer = val;
                              });
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
                    color: AppColors.purple100,
                    alignment: Alignment.center,
                    child: Text('123 123\$',
                        style: AppFonts.font36w700
                            .copyWith(color: AppColors.textPrimary)),
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
                            title: 'Отправить',
                            icon: SvgPicture.asset(
                              'assets/icons/send.svg',
                              width: sizeOf.width * 0.067,
                              height: sizeOf.width * 0.067,
                            ),
                          ),
                          WalletAction(
                            title: 'Пополнить',
                            icon: SvgPicture.asset(
                              'assets/icons/get.svg',
                              width: sizeOf.width * 0.067,
                              height: sizeOf.width * 0.067,
                            ),
                          ),
                          WalletAction(
                            title: 'Купить',
                            icon: SvgPicture.asset(
                              'assets/icons/buy.svg',
                              width: sizeOf.width * 0.067,
                              height: sizeOf.width * 0.067,
                            ),
                          ),
                          WalletAction(
                            title: 'Своп ',
                            icon: SvgPicture.asset(
                              'assets/icons/swap.svg',
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
                        delegate: SliverChildListDelegate(list
                            .map((item) => ValidToken(
                                  title: 'Protocol',
                                  value: '211,12',
                                  onTap: () {
                                    context.push(RouteNames.walletCurrency);
                                  },
                                  prise: '0,29',
                                  increment: '0,02',
                                  usdValue: '0,0021',
                                ))
                            .toList()),
                      )
                    : SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) => MarketItem(
                            imageUrl: 'assets/images/burger.png',
                            textDescription:
                                'Набор бонусов для игры Reapers rush +156 к мощности',
                            isNew: true,
                            pizdulkaUrl: '',
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