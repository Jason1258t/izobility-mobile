import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/feature/home/ui/home_screen.dart';
import 'package:izobility_mobile/routes/go_routes.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';

class CustomMainNavigationBar extends StatefulWidget {
  const CustomMainNavigationBar({super.key, required this.onTap, required this.pageIndex});

  final int pageIndex;
  final Function onTap;

  @override
  State<CustomMainNavigationBar> createState() =>
      _CustomMainNavigationBarState();
}

class _CustomMainNavigationBarState extends State<CustomMainNavigationBar> {
  @override
  Widget build(BuildContext context) {
    GoRouter router = GoRouter.of(context);
    
    return Container(
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
            isSelected: widget.pageIndex == 0,
            onTap: () {
              //homeRepository.onSelectTab(0);

              router.go(RouteNames.main);
            },
            name: 'Главная',
          ),
          NavigatorBarItem(
            asset: 'assets/icons/wallet.svg',
            isSelected: widget.pageIndex == 1,
            onTap: () {
              //homeRepository.onSelectTab(1);

              router.go(RouteNames.walletAuth);
            },
            name: 'Кошелек',
          ),
          NavigatorBarItem(
            asset: 'assets/icons/gamepad.svg',
            isSelected: widget.pageIndex == 2,
            onTap: () {
              //homeRepository.onSelectTab(2);
              
              router.go(RouteNames.games);
            },
            name: 'Игротека',
          ),
          NavigatorBarItem(
            asset: 'assets/icons/card.svg',
            isSelected: widget.pageIndex == 3,
            onTap: () {
              //homeRepository.onSelectTab(3);

              router.go(RouteNames.basket);
            },
            name: 'Корзина',
          ),
          NavigatorBarItem(
            asset: 'assets/icons/user.svg',
            isSelected: widget.pageIndex == 4,
            onTap: () {
              //homeRepository.onSelectTab(4);

              router.go(RouteNames.profile);
            },
            name: 'Профиль',
          ),
        ],
      ),
    );
  }
}
