import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izobility_mobile/utils/colors.dart';
import 'package:izobility_mobile/utils/fonts.dart';

class KeyboardButton extends StatelessWidget {
  KeyboardButton({super.key, required this.onTap, String? number})
      : child = number != null
            ? Text(
                number,
                style: AppFonts.font16w700.copyWith(color: Colors.black),
              )
            : SvgPicture.asset(
                'assets/icons/delete-left.svg',
                width: 24,
              );

  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(33),
      onTap: onTap,
      child: Ink(
        width: 66,
        height: 66,
        decoration: ShapeDecoration(
          color: AppColors.backgroundSecondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(33),
          ),
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
