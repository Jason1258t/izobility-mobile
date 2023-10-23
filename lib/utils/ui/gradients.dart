import 'package:flutter/material.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';

abstract class AppGradients {
  static const gradientGreenWhite = LinearGradient(
    begin: Alignment(-1, -1),
    end: Alignment(1, 1),
    colors: [Color(0xFF1CFE15), Color(0xFF4EFDC6)],
  );

  static const gradientGreenDark = LinearGradient(
      begin: Alignment(-0.12, 0.99),
      end: Alignment(0.12, -0.99),
      colors: [
        Color(0xff3FCA3B),
        Color(0xff2FC294),
      ]);

  static final gradientWhiteGray = LinearGradient(
    begin: const Alignment(-0.12, 0.99),
    end: const Alignment(0.12, -0.99),
    colors: [
      Colors.black.withOpacity(0.6499999761581421),
      Colors.black.withOpacity(0)
    ],
  );

  static const gradientBlackGrey = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Colors.black, AppColors.switcherBackground]);
}
