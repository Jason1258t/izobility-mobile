import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:izobility_mobile/feature/crypto_wallet/ui/pages/crypto_wallet_screen.dart';
import 'package:izobility_mobile/feature/home/data/home_repository.dart';
import 'package:izobility_mobile/feature/main/ui/main_screen.dart';
import 'package:izobility_mobile/feature/profile/ui/pages/profile.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/utils/ui/fonts.dart';
import 'package:izobility_mobile/widgets/navigator_bar/custom_main_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetOptions = <Widget>[
      const MainScreen(),
      const CryptoWalletScreen(),
      const Text('Delection'),
      const Text('Delection'),
      const ProfileScreen(),
    ];

    final homeRepository = context.read<HomeRepository>();

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          body: widgetOptions[homeRepository.selectedTab],
          bottomNavigationBar: CustomMainNavigationBar(
            onTap: () {
              setState(() {});
            },
          )),
    );
  }
}

class NavigatorBarItem extends StatelessWidget {
  const NavigatorBarItem(
      {Key? key,
      required this.asset,
      required this.isSelected,
      required this.onTap,
      required this.name})
      : super(key: key);

  final String asset;
  final String name;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 5,
        height: MediaQuery.of(context).size.width / 5,
        child: Center(
          child: Column(
            children: [
              SvgPicture.asset(
                asset,
                height: 28,
                width: 28,
                // ignore: deprecated_member_use
                color: isSelected ? AppColors.textPrimary : AppColors.disable,
              ),
              FittedBox(
                child: Text(
                  name,
                  style: AppFonts.font12w700.copyWith(
                      color: isSelected
                          ? AppColors.textPrimary
                          : AppColors.disable),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
