import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:izobility_mobile/feature/home/data/home_repository.dart';
import 'package:izobility_mobile/feature/home/ui/home_screen.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';

class CustomMainNavigationBar extends StatefulWidget {
  const CustomMainNavigationBar({super.key, required this.onTap});

  final Function onTap;

  @override
  State<CustomMainNavigationBar> createState() =>
      _CustomMainNavigationBarState();
}

class _CustomMainNavigationBarState extends State<CustomMainNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final homeRepository = RepositoryProvider.of<HomeRepository>(context);


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
            isSelected: homeRepository.selectedTab == 0,
            onTap: () {
              homeRepository.onSelectTab(0);
              widget.onTap();
            },
            name: 'Главная',
          ),
          NavigatorBarItem(
            asset: 'assets/icons/wallet.svg',
            isSelected: homeRepository.selectedTab == 1,
            onTap: () {
              homeRepository.onSelectTab(1);
              widget.onTap();
            },
            name: 'Кошелек',
          ),
          NavigatorBarItem(
            asset: 'assets/icons/gamepad.svg',
            isSelected: homeRepository.selectedTab == 2,
            onTap: () {
              homeRepository.onSelectTab(2);
              widget.onTap();
            },
            name: 'Игротека',
          ),
          NavigatorBarItem(
            asset: 'assets/icons/card.svg',
            isSelected: homeRepository.selectedTab == 3,
            onTap: () {
              homeRepository.onSelectTab(3);
              widget.onTap();
            },
            name: 'Корзина',
          ),
          NavigatorBarItem(
            asset: 'assets/icons/user.svg',
            isSelected: homeRepository.selectedTab == 4,
            onTap: () {
              homeRepository.onSelectTab(4);
              widget.onTap();
            },
            name: 'Профиль',
          ),
        ],
      ),
    );
  }
}
