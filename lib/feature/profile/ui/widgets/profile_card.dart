import 'package:flutter/material.dart';
import 'package:izobility_mobile/utils/utils.dart';


class ProfileCard extends StatefulWidget {
  // final String name;
  // final String status;
  // final String imagePath;

  const ProfileCard({
    super.key,
  });

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: AppColors.backBack),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'name',
                style:
                    AppFonts.font16w500.copyWith(color: AppColors.textPrimary),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'status',
                style:
                    AppFonts.font12w400.copyWith(color: AppColors.textPrimary),
              ),
            ],
          ),
        ]);
  }
}
