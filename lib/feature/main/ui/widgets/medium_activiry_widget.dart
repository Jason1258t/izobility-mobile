import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:izobility_mobile/utils/ui/fonts.dart';

class MediumActivityWidget extends StatelessWidget {
  const MediumActivityWidget(
      {super.key, required this.width, required this.height, required this.iconName, required this.text, required this.onTap});

  final double width;
  final double height;
  final String iconName;
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Ink(
        width: width,
        height: height,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          children: [
            SvgPicture.asset(iconName, width: 30, height: 30, color: Colors.black,),
            const SizedBox(height: 5,),
            FittedBox(
                child: Text(text, style: AppTypography.font14w400.copyWith(color: Colors.black),))
          ],
        ),
      ),
    );
  }
}
