import 'package:flutter/material.dart';
import '../../utils/utils.dart';

class CustomButton extends StatelessWidget {
  final String text;

  final VoidCallback onTap;
  final double width;
  final double height;

  const CustomButton(
      {super.key,
      required this.text,
      required this.onTap,
      required this.width,
      this.height = 52});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
            color: AppColors.primary,
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 0.50, color: AppColors.primary),
              borderRadius: BorderRadius.circular(8),
            )),
        child: TextButton(
            onPressed: onTap, child: Text(text, style: AppFonts.font16w600)));
  }
}
