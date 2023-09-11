import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:izobility_mobile/utils/fonts.dart';
import 'package:izobility_mobile/utils/colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key,
      this.hintText,
      required this.controller,
      required this.width,
      this.keyboardType,
      this.validator,
      this.labelText,
      this.isObscured = false,
      this.height = 56});

  final TextEditingController controller;
  final String? hintText;
  final TextInputType? keyboardType;
  final double width;
  final double height;
  final String? Function(String?)? validator;
  final String? labelText;
  final bool isObscured;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final Color _negative = AppColors.negative;

  bool error = false;
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: widget.width,
            height: widget.height,
            child: TextFormField(
              obscureText: widget.isObscured,
              validator: widget.validator,
              onChanged: (String? value) {
                if (widget.validator != null) {
                  errorText = widget.validator!(value);
                  error = errorText != null;
                  setState(() {});
                }
              },
              style: AppFonts.font16w400.copyWith(
                  color: !error ? AppColors.textSecondary : AppColors.negative),
              decoration: InputDecoration(
                  //filled: true,
                  isDense: true,
                  fillColor: AppColors.backgroundSecondary,
                  contentPadding: const EdgeInsets.all(10),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: _negative)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      width: 1,
                      //strokeAlign: BorderSide.strokeAlignCenter,
                      color: Color(0xFFE2E2E2),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                      )),
                  labelText: widget.labelText,
                  labelStyle:
                      AppFonts.font16w400.copyWith(color: AppColors.hintText),
                  floatingLabelStyle:
                      AppFonts.font12w400.copyWith(color: Colors.black),
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  hintText: widget.hintText ?? widget.labelText,
                  hintStyle: AppFonts.font16w400.copyWith(
                      color: !error ? AppColors.hintText : _negative)),
              keyboardType: widget.keyboardType,
              controller: widget.controller,
            ),
          ),
          if (error) ...[
            Row(
              children: [
                const SizedBox(
                  width: 8,
                ),
                Text(
                  '* ${errorText!}',
                  style: AppFonts.font14w400.copyWith(color: _negative),
                )
              ],
            )
          ]
        ],
      ),
    );
  }
}
