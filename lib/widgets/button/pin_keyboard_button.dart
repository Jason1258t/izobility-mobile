import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/utils/ui/fonts.dart';

class KeyboardButton extends StatelessWidget {
  KeyboardButton(
      {super.key, required this.onTap, String? number, required this.side})
      : child = number != null
            ? Text(
                number,
                style: AppTypography.font16w700.copyWith(color: Colors.black),
              )
            : SvgPicture.asset(
                'assets/icons/delete-left.svg',
              );

  final VoidCallback onTap;
  final Widget child;
  final double side;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return InkWell(
      borderRadius: BorderRadius.circular(80),
      onTap: onTap,
      child: Ink(
        width: side,
        height: side,
        decoration: ShapeDecoration(
          color: AppColors.backgroundSecondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(80),
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(size.width * 0.055),
          child: FittedBox(child: child),
        ),
      ),
    );
  }
}
