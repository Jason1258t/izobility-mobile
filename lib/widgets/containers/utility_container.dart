import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izobility_mobile/utils/fonts.dart';
import 'package:izobility_mobile/utils/colors.dart';

class UtilityContainer extends StatelessWidget {
  const UtilityContainer({
    super.key,
    required this.name,
    required this.assetName,
    required this.callback,
    required this.width
  });

  final String assetName;
  final String name;
  final VoidCallback callback;
  final double width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        width: 104,
        height: 98,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: ShapeDecoration(
          color: AppColors.backgroundSecondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SvgPicture.asset(
                assetName,
                color: AppColors.textPrimary,
                width: 32,
                height: 32,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
                name,
                textAlign: TextAlign.center,
                style: AppFonts.font12w500.copyWith(
                    color: AppColors.textPrimary
                )
            )
          ],
        ),
      ),
    );
  }
}
