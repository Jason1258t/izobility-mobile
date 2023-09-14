import 'package:flutter/material.dart';
import 'package:izobility_mobile/utils/colors.dart';
import 'package:izobility_mobile/utils/fonts.dart';

class CustomSwitcher extends StatelessWidget {
  const CustomSwitcher({super.key, required this.active, required this.onTap});

  final int active;
  final Function(int value) onTap;

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);

    return Container(
      height: 50,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.backgroundSecondary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              onTap(0);
            },
            child: Container(
              width: (sizeOf.width - 60) / 2,
              height: 46,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: active == 0
                    ? AppColors.switcherBackground
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Wallet',
                style: AppFonts.font16w700.copyWith(
                    color: active == 0
                        ? AppColors.backgroundContent
                        : AppColors.textPrimary),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              onTap(1);
            },
            child: Container(
              width: (sizeOf.width - 60) / 2,
              height: 46,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: active == 1
                    ? AppColors.switcherBackground
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Игровые',
                style: AppFonts.font16w700.copyWith(
                    color: active == 1
                        ? AppColors.backgroundContent
                        : AppColors.textPrimary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
