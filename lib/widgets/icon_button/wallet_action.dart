import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izobility_mobile/utils/fonts.dart';
import 'package:izobility_mobile/utils/colors.dart';


class WalletAction extends StatelessWidget {
  const WalletAction({super.key, required this.text, required this.assetName, required this.callback});

  final String text;
  final VoidCallback callback;
  final String assetName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          child: Container(
            width: 56,
            height: 56,
            // padding: const EdgeInsets.all(12),
            decoration: ShapeDecoration(
                color: AppColors.textContrast,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)
                )
            ),
            child: Center(
              child: SvgPicture.asset(
                assetName,
                color: AppColors.textPrimary,
                width: 32,
              ),
            ),
          ),
          onTap: callback,
        ),
        SizedBox(width: 4,),
        Text(
          text,
          textAlign: TextAlign.center,
          style: AppFonts.buttonSmall.copyWith(
            color: AppColors.textPrimary,
            height: 1.50
          )
        )
      ],
    );
  }
}