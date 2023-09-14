import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:izobility_mobile/utils/colors.dart';
import 'package:izobility_mobile/utils/fonts.dart';
import 'package:izobility_mobile/widgets/switches/custom_switcher.dart';

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
          body: CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                pinned: true,
                floating: true,
                delegate: _SliverAppBarDelegate(
                  minHeight: 60,
                  maxHeight: 90,
                  child: Container(
                    color: AppColors.purple100,
                    alignment: Alignment.center,
                    child: Text('Кошелёк',
                        style: AppFonts.font18w700
                            .copyWith(color: AppColors.textPrimary)),
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: false,
                floating: true,
                delegate: _SliverAppBarDelegate(
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
                delegate: _SliverAppBarDelegate(
                  minHeight: 40,
                  maxHeight: 40,
                  child: Container(
                    color: AppColors.purple100,
                    alignment: Alignment.center,
                    child: Text('123 123\$',
                        style: AppFonts.font32w700
                            .copyWith(color: AppColors.textPrimary)),
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                floating: true,
                delegate: _SliverAppBarDelegate(
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
                          _WalletAction(
                            title: 'asdf',
                            icon: SvgPicture.asset(
                              'assets/icons/send.svg',
                              width: sizeOf.width * 0.067,
                              height: sizeOf.width * 0.067,
                            ),
                          ),
                          _WalletAction(
                            title: 'asdf',
                            icon: SvgPicture.asset(
                              'assets/icons/send.svg',
                              width: sizeOf.width * 0.067,
                              height: sizeOf.width * 0.067,
                            ),
                          ),
                          _WalletAction(
                            title: 'asdf',
                            icon: SvgPicture.asset(
                              'assets/icons/send.svg',
                              width: sizeOf.width * 0.067,
                              height: sizeOf.width * 0.067,
                            ),
                          ),
                          _WalletAction(
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
                delegate: _SliverAppBarDelegate(
                  minHeight: 16,
                  maxHeight: 16,
                  child: Container(
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
                delegate: _SliverAppBarDelegate(
                  minHeight: 40,
                  maxHeight: 40,
                  child: Container(
                    color: AppColors.backgroundSecondary,
                    child: TabBar(
                      labelColor: AppColors.textPrimary,
                      indicatorColor: AppColors.textPrimary,
                      indicatorWeight: 2,
                      indicator: const UnderlineTabIndicator(
                        borderSide: BorderSide(color: AppColors.textPrimary, width: 2),
                        insets: EdgeInsets.symmetric(horizontal: -40)
                      ),
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
              SliverList(
                delegate: SliverChildListDelegate(
                  tokenOrNft == 0 ? list
                      .map((item) =>
                          SizedBox(height: 100, child: Text('${item}')))
                      .toList() : list
                      .map((item) =>
                      SizedBox(height: 100, child: Text('${23}')))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class _WalletAction extends StatelessWidget {
  const _WalletAction({super.key, required this.title, required this.icon});

  final String title;
  final SvgPicture icon;

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);

    return Column(
      children: [
        CircleAvatar(
            radius: sizeOf.width * 0.078,
            backgroundColor: AppColors.primary,
            child: icon),
        const SizedBox(
          height: 4,
        ),
        Text(title),
      ],
    );
  }
}
