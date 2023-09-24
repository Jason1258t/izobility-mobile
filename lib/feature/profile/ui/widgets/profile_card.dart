import 'package:flutter/material.dart';
import 'package:izobility_mobile/utils/utils.dart';


class ProfileCard extends StatefulWidget {
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
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: AppColors.primary),
            child: const Icon(Icons.camera_alt_outlined, color: Colors.white, size: 23,),
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'name',
                style:
                    AppFonts.font18w700.copyWith(color: AppColors.textPrimary, height: 1),
              ),
              const SizedBox(height: 3,),
              Text(
                'status',
                style:
                    AppFonts.font12w400.copyWith(color: AppColors.textPrimary, height: 1),
              ),
            ],
          ),
        ]);
  }
}
