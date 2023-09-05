import 'package:flutter/material.dart';
import 'package:izobility_mobile/utils/fonts.dart';

import '../../utils/colors.dart';

class TextButtonWithoutBackground extends StatelessWidget {
  const TextButtonWithoutBackground(
      {super.key, required this.onTap, required this.text});

  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          padding: const EdgeInsets.all(6),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          foregroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent),
      onPressed: onTap,
      child: Text(
        text,
        style: AppFonts.font16w400.copyWith(color: AppColors.disable),
      ),
    );
  }
}
