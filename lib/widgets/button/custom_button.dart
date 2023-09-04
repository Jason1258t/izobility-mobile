import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utils/utils.dart';

class CustomButton extends StatelessWidget {
  final String text ;
  final VoidCallback onTap;
  const CustomButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 266,
        height: 52,
        decoration: ShapeDecoration(
            color:AppColors.primary,
            shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0.50, color: AppColors.primary),
          borderRadius: BorderRadius.circular(8),)
        ),
        child: TextButton(
            onPressed: () => onTap(), child: Text(text, style: AppFonts.font16w600))
    );
  }
}
