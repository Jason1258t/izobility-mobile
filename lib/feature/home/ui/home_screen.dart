import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:izobility_mobile/feature/main/ui/main_screen.dart';
import 'package:izobility_mobile/utils/colors.dart';

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
          width: MediaQuery.of(context).size.width,
          height: 60,
          decoration: const BoxDecoration(
            color: AppColors.backgroundContent,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24), topRight: Radius.circular(24))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NavigatorBarItem(
                asset: 'assets/icons/home.svg',
                isSelected: _selectedTab == 0,
                onTap: () {
                  onSelectTab(0);
                },
              ),
              NavigatorBarItem(
                asset: 'assets/icons/message.svg',
                isSelected: _selectedTab == 1,
                onTap: () {
                  onSelectTab(1);
                },
              ),
              NavigatorBarItem(
                asset: 'assets/icons/target.svg',
                isSelected: _selectedTab == 2,
                onTap: () {
                  onSelectTab(2);
                },
              ),
              NavigatorBarItem(
                asset: 'assets/icons/market.svg',
                isSelected: _selectedTab == 3,
                onTap: () {
                  onSelectTab(3);
                },
              ),
              NavigatorBarItem(
                asset: 'assets/icons/all.svg',
                isSelected: _selectedTab == 4,
                onTap: () {
                  onSelectTab(4);
                },
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
      required this.onTap})
      : super(key: key);

  final String asset;
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
          child: SvgPicture.asset(
            asset,
            height: 28,
            width: 28,
            // ignore: deprecated_member_use
            color: isSelected ? AppColors.primary : AppColors.disable,
          ),
        ),
      ),
    );
  }
}
