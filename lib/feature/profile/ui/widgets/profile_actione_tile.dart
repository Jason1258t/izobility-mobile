import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izobility_mobile/utils/utils.dart';

class ProfileActionTile extends StatelessWidget {
  final Function onTap;
  final String label;
  final String iconPath;

  const ProfileActionTile({
    super.key,
    required this.onTap,
    required this.label,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconPath,
              color: AppColors.textPrimary,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              label,
              style: AppFonts.font16w500.copyWith(color: AppColors.textPrimary),
            )
          ],
        ),
      ),
    );
  }
}
