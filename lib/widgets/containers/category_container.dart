import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/colors.dart';
import '../../utils/fonts.dart';

class Conteiner extends StatelessWidget {
  const Conteiner({super.key, required this.asset, required this.text, required this.onTap});

  final String asset;
  final  String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 110,
        height: 68,
        padding: const EdgeInsets.only(top: 7, left: 8, right: 18, bottom: 9),
        decoration: ShapeDecoration(
          color: AppColors.backgroundSecondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(asset),
            Text(text,
                style:
                AppFonts.font12w500.copyWith(color: AppColors.textPrimary))
          ],
        ),
      ),
    );
  }
}