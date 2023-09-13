import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:izobility_mobile/utils/fonts.dart';
import 'package:izobility_mobile/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.hintText,
      required this.controller,
      required this.width,
      this.keyboardType,
      this.labelText,
      this.obscured = false,
      this.onChange,
      this.error = false,
      this.errorText,
      this.suffixIcon,
      this.suffixIconCallback,
      this.height = 56});

  CustomTextField.password(
      {super.key,
      this.hintText,
      required this.controller,
      required this.width,
      this.labelText,
      this.onChange,
      required this.obscured,
      this.error = false,
      this.errorText,
      this.height = 56,
      required this.suffixIconCallback})
      : keyboardType = TextInputType.visiblePassword,
        suffixIcon = SuffixIconPassword(
          callback: suffixIconCallback!,
          visible: !obscured,
        );

  final TextEditingController controller;
  final String? hintText;
  final TextInputType? keyboardType;
  final double width;
  final double height;
  final String? labelText;
  final bool obscured;
  final bool error;
  final String? errorText;
  final VoidCallback? suffixIconCallback;
  final Widget? suffixIcon;
  final Function(String?)? onChange;

  final Color _negative = AppColors.negative;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: width,
            height: height,
            child: TextFormField(
              obscureText: obscured,
              onChanged: onChange,
              style: AppFonts.font16w400.copyWith(color: Colors.black),
              decoration: InputDecoration(
                  //isDense: true,
                  fillColor: AppColors.backgroundSecondary,
                  contentPadding: const EdgeInsets.all(10),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      width: 1,
                      color: Color(0xFFE2E2E2),
                    ),
                  ),
                  suffixIcon: suffixIcon,
                  suffixIconConstraints:
                      const BoxConstraints(maxHeight: 40, maxWidth: 40),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                      )),
                  labelText: labelText,
                  labelStyle:
                      AppFonts.font16w400.copyWith(color: AppColors.hintText),
                  floatingLabelStyle: AppFonts.font12w400
                      .copyWith(color: error ? _negative : Colors.black),
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  hintText: hintText ?? labelText,
                  hintStyle:
                      AppFonts.font16w400.copyWith(color: AppColors.hintText)),
              keyboardType: keyboardType,
              controller: controller,
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

class SuffixIconPassword extends StatelessWidget {
  const SuffixIconPassword(
      {super.key, required this.callback, required this.visible});

  final VoidCallback callback;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: callback,
      child: Container(
        padding: const EdgeInsets.all(8),
        width: 40,
        height: 40,
        child: SvgPicture.asset(
          'assets/icons/eye.svg',
          width: 24,
          height: 24,
          //color: visible ? AppColors.primary : const Color(0xff757575),
          colorFilter: ColorFilter.mode(
              visible ? AppColors.primary : AppColors.disabledTextButton,
              BlendMode.srcIn),
        ),
      ),
    );
  }
}
