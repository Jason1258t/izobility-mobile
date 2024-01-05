import 'package:flutter/material.dart';
import 'package:izobility_mobile/localization/app_localizations.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_sliver_app_bar_delegate.dart';

class WalletTabBarTokensOrNFT extends StatelessWidget {
  const WalletTabBarTokensOrNFT(
      {super.key, required this.tabController, required this.onTabTapped});

  final TabController tabController;
  final Function(int) onTabTapped;

  @override
  Widget build(BuildContext context) {
    final localize = AppLocalizations.of(context)!;

    return SliverPersistentHeader(
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
                borderSide: BorderSide(color: AppColors.textPrimary, width: 2),
                insets: EdgeInsets.symmetric(horizontal: -40)),
            onTap: onTabTapped,
            controller: tabController,
            tabs: [
              Tab(
                text: localize.tokens,
              ),
              const Tab(text: 'NFT'),
            ],
          ),
        ),
      ),
    );
  }
}
