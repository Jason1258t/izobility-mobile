import 'package:flutter/material.dart';
import 'package:izobility_mobile/utils/colors.dart';
import 'package:izobility_mobile/utils/fonts.dart';

class ProfileInfoElement extends StatelessWidget {
  const ProfileInfoElement({
    Key? key,
    required this.mainText,
    required this.subText}) : super(key: key);

  final String mainText;
  final String subText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            mainText,
            textAlign: TextAlign.left,
            style: AppFonts.font16w500.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            subText,
            textAlign: TextAlign.left,
            style: AppFonts.font12w400.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
