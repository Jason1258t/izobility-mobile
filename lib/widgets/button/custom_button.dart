import 'package:flutter/material.dart';
import '../../utils/utils.dart';

class CustomButton extends StatefulWidget {
  final String text;

  final VoidCallback onTap;
  final double width;
  final double height;

  final bool isActive;

  const CustomButton(
      {super.key,
      required this.text,
      required this.onTap,
      required this.width,
      this.isActive = true,
      this.height = 48});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width,
        height: widget.height,
        decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
          side: BorderSide(
              width: 0.50,
              color: widget.isActive ? AppColors.primary : AppColors.disable),
          borderRadius: BorderRadius.circular(12),
        )),
        child: TextButton(
            onPressed: widget.isActive ? widget.onTap : () {},
            style: TextButton.styleFrom(
                backgroundColor: widget.isActive
                    ? AppColors.primary
                    : AppColors.disableButton,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            child: Text(widget.text, style: AppFonts.font16w600)));
  }
}
