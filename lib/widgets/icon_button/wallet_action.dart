import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izobility_mobile/utils/fonts.dart';
import 'package:izobility_mobile/utils/colors.dart';

class WalletAction extends StatelessWidget {
  const WalletAction(
      {super.key,
      required this.text,
      required this.assetName,
      required this.callback,
      required this.height,
      required this.width});

  final String text;
  final VoidCallback callback;
  final String assetName;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: callback,
          child: Container(
            width: width,
            height: height,
            padding: const EdgeInsets.all(12),
            decoration: ShapeDecoration(
                color: AppColors.textContrast,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6))),
            child: Center(
              child: SvgPicture.asset(
                assetName,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(text,
            textAlign: TextAlign.center,
            style: AppFonts.font12w500
                .copyWith(color: AppColors.textPrimary, height: 1.50))
      ],
    );
  }
}
