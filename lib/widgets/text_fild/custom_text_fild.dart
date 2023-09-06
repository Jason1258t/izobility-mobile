import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:izobility_mobile/utils/fonts.dart';
import 'package:izobility_mobile/utils/colors.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.width,
      this.keyboardType,
      this.validator,
      this.height = 48});

  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final double width;
  final double height;
  final String? Function(String?)? validator;

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
      //height: height,
      child: Column(
        children: [
          TextFormField(
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
                filled: true,
                fillColor: AppColors.backgroundSecondary,
                contentPadding: const EdgeInsets.all(10),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: _negative)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none),
                hintText: widget.hintText,
                hintStyle: AppFonts.font16w400
                    .copyWith(color: !error ? AppColors.hintText : _negative)),
            keyboardType: widget.keyboardType,
            controller: widget.controller,
          ),
          if (error) ...[
            Row(
              children: [
                // SvgPicture.asset(assetName)
                const SizedBox(width: 10,),
                Text(
                  errorText!,
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
