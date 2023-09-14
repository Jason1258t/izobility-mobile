import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../utils/utils.dart';

class CashContainer extends StatelessWidget {
  final String text;
  final String assetName;

  const CashContainer({super.key, required this.text, required this.assetName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        height: 36,
        decoration: ShapeDecoration(
          color: AppColors.backgroundContent,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 0.50, color: AppColors.border),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          children: [
            Image.asset(
              assetName,
              width: 24,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(text,
                style: AppFonts.font16w700
                    .copyWith(color: AppColors.textSecondary))
          ],
        ),
      ),
      onTap: () {},
    );
  }
}
