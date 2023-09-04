import 'package:flutter/material.dart';
import 'package:izobility_mobile/utils/fonts.dart';
import 'package:izobility_mobile/utils/colors.dart';

class CustomTextFild extends StatelessWidget {
  const CustomTextFild(
      {super.key, required this.hinttext, this.controller, this.keyboardType});

  final TextEditingController? controller;
  final String hinttext;
  final TextInputType? keyboardType;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 266,
        height: 48,
        child: TextField(
          style: AppFonts.buttonDefault.copyWith(
            color: AppColors.textSecondary
          ),
          decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFF2F2F2),
              contentPadding: EdgeInsets.all(10),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none
              ),
              hintText: hinttext,
              hintStyle: AppFonts.buttonDefault.copyWith(
                color: AppColors.textSecondary
              )
          ),
          keyboardType: keyboardType,
          controller: controller,
        ),
      ),
    );
  }
}