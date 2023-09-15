import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:izobility_mobile/feature/crypto_wallet/ui/pages/crypto_wallet_screen.dart';
import 'package:izobility_mobile/feature/main/ui/main_screen.dart';
import 'package:izobility_mobile/feature/profile/ui/pages/profile.dart';
import 'package:izobility_mobile/utils/colors.dart';
import 'package:izobility_mobile/utils/fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

const String _emptyLabel = '';

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetOptions = <Widget>[
      const MainScreen(),
      const CryptoWalletScreen(),
      const Text('Delection'),
      const Text('Delection'),
      const ProfileScreen(),
    ];

    void onSelectTab(int index) {
      if (_selectedTab == index) return;
      setState(() {
        _selectedTab = index;
      });
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: widgetOptions[_selectedTab],
        bottomNavigationBar: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(top: 8),
          height: 64,
          decoration: const BoxDecoration(
              color: AppColors.backgroundContent,
              border: Border(
                  top: BorderSide(color: AppColors.disableButton, width: 1))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              NavigatorBarItem(
                asset: 'assets/icons/home.svg',
                isSelected: _selectedTab == 0,
                onTap: () {
                  onSelectTab(0);
                },
                name: 'Главная',
              ),
              NavigatorBarItem(
                asset: 'assets/icons/wallet.svg',
                isSelected: _selectedTab == 1,
                onTap: () {
                  onSelectTab(1);
                },
                name: 'Кошелек',
              ),
              NavigatorBarItem(
                asset: 'assets/icons/gamepad.svg',
                isSelected: _selectedTab == 2,
                onTap: () {
                  onSelectTab(2);
                },
                name: 'Игротека',
              ),
              NavigatorBarItem(
                asset: 'assets/icons/card.svg',
                isSelected: _selectedTab == 3,
                onTap: () {
                  onSelectTab(3);
                },
                name: 'Корзина',
              ),
              NavigatorBarItem(
                asset: 'assets/icons/user.svg',
                isSelected: _selectedTab == 4,
                onTap: () {
                  onSelectTab(4);
                },
                name: 'Профиль',
              ),
            ],
          ),
        ),
      ),
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
              Text(
                name,
                style: AppFonts.font12w700.copyWith(
                    color:
                        isSelected ? AppColors.textPrimary : AppColors.disable),
              )
            ],
          ),
        ),
      ),
    );
  }
}
