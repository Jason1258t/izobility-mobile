import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/feature/profile/data/user_repository.dart';
import 'package:izobility_mobile/feature/wallet/data/wallet_repository.dart';
import 'package:izobility_mobile/localization/app_localizations.dart';
import 'package:izobility_mobile/routes/go_routes.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_sliver_app_bar.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_sliver_app_bar_delegate.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/utils/ui/fonts.dart';
import 'package:izobility_mobile/widgets/popup/custom_popup.dart';
import 'package:izobility_mobile/widgets/scaffold/wallet_scaffold.dart';
import 'package:izobility_mobile/widgets/switches/custom_switcher.dart';

import 'sections/wallet_in_game_tab.dart';
import 'sections/wallet_on_chain_tab.dart';

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

    final walletRepository = RepositoryProvider.of<WalletRepository>(context);
    final UserRepository userRepository =
        RepositoryProvider.of<UserRepository>(context);

    walletRepository.getOnChainCoinsData();
    walletRepository.getUserEmeraldBill();
    walletRepository.getGameTokens();

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (userRepository.user.details?.phone == null ||
          userRepository.user.details?.phone == "") {
        showNotVerifiedDialog();
      }
    });
  }

  void showNotVerifiedDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return CustomPopup(
              imagePath: "assets/images/sad_emoji.png",
              onTap: () {
                context.pop();
                context.go(RouteNames.profile);
              },
              label: AppLocalizations.of(context)!.number_not_confirmed);
        });
  }

  void setTab(int tab) {
    setState(() {
      tokenOrNft = tab;
    });
  }

  Widget getActivePage(bool tap) {
    final sizeOf = MediaQuery.sizeOf(context);

    return tap
        ? WalletOnChainTab(
            sizeOf: sizeOf,
            tabController: _tabController,
            tokenOrNft: tokenOrNft,
            onTabTapped: setTab)
        : WalletInGameTab(
            sizeOf: sizeOf,
            tabController: _tabController,
            tokenOrNft: tokenOrNft,
            onTabTapped: setTab);
  }

  @override
  Widget build(BuildContext context) {
    final walletRepository = RepositoryProvider.of<WalletRepository>(context);

    final localize = AppLocalizations.of(context)!;

    return WalletScaffold(
      backgroundColor: Colors.white,
      scaffoldColor: AppColors.purpleBcg,
      onTap: () {},
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(
            decelerationRate: ScrollDecelerationRate.normal),
        slivers: [
          CustomSliverAppBar(
            height: 90,
            isBack: false,
            title: localize.wallet,
            color: Colors.white,
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
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomSwitcher(
                        active: walletRepository.walletPage,
                        onTap: (int val) {
                          setState(() {
                            walletRepository.setWalletPage(val);
                          });
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        localize.current_balance,
                        style: AppTypography.font14w400
                            .copyWith(color: AppColors.grey600),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          getActivePage(walletRepository.walletPage == 0 ? true : false),
        ],
      ),
    );
  }
}
