import 'package:flutter/material.dart';
import 'package:izobility_mobile/utils/fonts.dart';
import 'package:izobility_mobile/utils/colors.dart';

class GuidesSuggestion extends StatelessWidget {
  const GuidesSuggestion({
    super.key,
    required this.text,
    required this.imageUrl,
    required this.onTap,
  });

  final String text;
  final String imageUrl;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 95,
        height: 95,
        padding: const EdgeInsets.all(5),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          image: DecorationImage(image: AssetImage(imageUrl)),
        ),
        child: Container(
          padding: const EdgeInsets.all(5),
          alignment: Alignment.bottomCenter,
          decoration: ShapeDecoration(
            color: AppColors.transparentBlack,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: Text(
            text,
            style: AppFonts.font8w700,
          ),
        ),
      ),
    );
  }
}
