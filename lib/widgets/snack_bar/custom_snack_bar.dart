import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/utils/ui/fonts.dart';

abstract class CustomSnackBar {
  static const String copied = 'Скопировано!';

  static final snackBarCopied = SnackBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.purple200,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/verified.svg',
              width: 28,
              color: AppColors.primary,
            ),
            Text(
              'Скопировано!',
              style: AppTypography.font18w700.copyWith(color: AppColors.primary),
            )
          ],
        )),
  );

  static SnackBar snackBarWithCustomText(String text) =>
      SnackBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: AppTypography.font16w700.copyWith(color: Colors.black),
                )
              ],
            )),
      );
}


