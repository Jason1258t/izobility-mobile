import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../utils/fonts.dart';

class GuidesSuggestion extends StatelessWidget {
  GuidesSuggestion({
    super.key,
    required this.text,
    required this.imageUrl,
    required this.onTap,
    required this.viewed,
  });

  final String text;
  final String imageUrl;
  final VoidCallback onTap;

  final BorderSide viewBorderSide = BorderSide(
    width: 0.50,
    strokeAlign: BorderSide.strokeAlignOutside,
    color: AppColors.primaryPressedBackground,
  );

  final BorderSide notWhite = BorderSide.none;

  final bool viewed;

  final LinearGradient conteinerColorGradient = LinearGradient(
    begin: Alignment(-0.12, 0.99),
    end: Alignment(0.12, -0.99),
    colors: [
      Colors.black.withOpacity(0.6499999761581421),
      Colors.black.withOpacity(0)
    ],
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 100,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: viewed ? viewBorderSide : notWhite,
            borderRadius: BorderRadius.circular(16),
          ),
          image:
              DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.cover),
        ),
        child: Container(
          padding: EdgeInsets.all(6),
          alignment: Alignment.bottomCenter,
          width: 100,
          height: 100,
          decoration: ShapeDecoration(
            gradient: conteinerColorGradient,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Text(
            text,
            style: AppFonts.font8w700.copyWith(fontSize: 10),
          ),
        ),
      ),
    );
  }
}
