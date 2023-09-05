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
    return Center(
      child: Container(
        width: width,
        height: height,
        child: TextField(
          style:
              AppFonts.buttonDefault.copyWith(color: AppColors.textSecondary),
          decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFF2F2F2),
              contentPadding: EdgeInsets.all(10),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none),
              hintText: hintText,
              hintStyle: AppFonts.buttonDefault
                  .copyWith(color: AppColors.textSecondary)),
          keyboardType: keyboardType,
          controller: controller,
        ),
      ),
    );
  }
}
