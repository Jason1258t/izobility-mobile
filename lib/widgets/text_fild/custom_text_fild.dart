import 'package:flutter/material.dart';
import 'package:izobility_mobile/utils/fonts.dart';
import 'package:izobility_mobile/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.width,
      this.keyboardType,
      this.height = 48});

  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextField(
        style:
            AppFonts.font16w400.copyWith(color: AppColors.textSecondary),
        decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.backgroundSecondary,
            contentPadding: const EdgeInsets.all(10),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none),
            hintText: hintText,
            hintStyle: AppFonts.font16w400
                .copyWith(color: AppColors.textSecondary)),
        keyboardType: keyboardType,
        controller: controller,
      ),
    );
  }
}
