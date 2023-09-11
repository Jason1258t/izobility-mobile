import 'package:flutter/material.dart';
import 'package:izobility_mobile/utils/colors.dart';
import 'package:izobility_mobile/utils/fonts.dart';

class ApplicationInfoTitleLink extends StatelessWidget {
  const ApplicationInfoTitleLink({
    Key? key,
    required this.title,
    required this.onTap}) : super(key: key);

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(16),
      child: InkWell(
        onTap: onTap,
        child: Text(
          title,
          textAlign: TextAlign.left,
          style: AppFonts.font16w500.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
      ),
    );
  }
}
