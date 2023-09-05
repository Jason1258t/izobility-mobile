import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:izobility_mobile/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetOptions = <Widget>[
      const Text('Delection'),
      const Text('Delection'),
      const Text('Delection'),
      const Text('Delection'),
      const Text('Delection'),
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
          decoration: const BoxDecoration(
              border:
                  Border(top: BorderSide(color: Color(0xffDEE2E7), width: 1))),
          child: BottomNavigationBar(
            backgroundColor: const Color(0xffFBFBFC),
            iconSize: 30,
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedTab,
            items: [
              BottomNavigationBarItem(
                  icon: NavigatorBarItem(
                    asset: 'assets/icons/home.svg',
                    isSelected: _selectedTab == 0,
                  ),
                  tooltip: 'Page daccueil',
                  label: 'Page daccueil'),
              BottomNavigationBarItem(
                icon: NavigatorBarItem(
                  asset: 'assets/icons/message.svg',
                  isSelected: _selectedTab == 1,
                ),
                tooltip: 'asdf',
                label: 'asdf',
              ),
              BottomNavigationBarItem(
                icon: NavigatorBarItem(
                  asset: 'assets/icons/target.svg',
                  isSelected: _selectedTab == 2,
                ),
                tooltip: 'Délection',
                label: 'Délection',
              ),
              BottomNavigationBarItem(
                icon: NavigatorBarItem(
                  asset: 'assets/icons/market.svg',
                  isSelected: _selectedTab == 3,
                ),
                tooltip: 'dfa',
                label: 'asdf',
              ),
              BottomNavigationBarItem(
                icon: NavigatorBarItem(
                  asset: 'assets/icons/market.svg',
                  isSelected: _selectedTab == 3,
                ),
                tooltip: 'dfa',
                label: 'asdf',
              ),
            ],
            // selectedLabelStyle: AppTypography.font10red,
            // unselectedLabelStyle: AppTypography.font10lightGray,
            // onTap: onSelectTab,
            // selectedItemColor: AppColors.red,
            // unselectedItemColor: AppColors.lightGray,
          ),
        ),
      ),
    );
  }
}

class NavigatorBarItem extends StatelessWidget {
  const NavigatorBarItem(
      {Key? key, required this.asset, required this.isSelected})
      : super(key: key);

  final String asset;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      asset,
      height: 24,
      width: 24,
      // ignore: deprecated_member_use
      color: isSelected ? AppColors.primary : AppColors.disable,
    );
  }
}
