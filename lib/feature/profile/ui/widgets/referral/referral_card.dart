import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:izobility_mobile/localization/app_localizations.dart';
import 'package:izobility_mobile/models/referal.dart';
import 'package:izobility_mobile/utils/ui/gradients.dart';
import 'package:izobility_mobile/utils/utils.dart';

class ReferralCard extends StatelessWidget {
  final ReferalModel referral;

  const ReferralCard({super.key, required this.referral});

  @override
  Widget build(BuildContext context) {
    final localize = AppLocalizations.of(context)!;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                width: 32,
                height: 32,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: AppGradients.gradientGreenWhite),
                child: referral.photo == null
                    ? SvgPicture.asset(
                  "assets/icons/profile.svg",
                  width: 26,
                )
                    : Image.network(
                    "https://api.z-boom.ru/user/photo/${referral.id}"),
              ),
              const SizedBox(
                width: 12,
              ),
              SizedBox(
                width: 160,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      referral.name == null ? referral.email : referral.name!,
                      overflow: TextOverflow.ellipsis,
                      style: AppTypography.font16w400
                          .copyWith(color: Colors.black),
                    ),
                    Text(
                      "${localize.level}: ${referral.referalLevel}",
                      style: AppTypography.font12w400
                          .copyWith(color: AppColors.grey500),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "+${referral.sum}",
                style: AppTypography.font16w700.copyWith(
                    color: referral.sum == 0
                        ? AppColors.grey500
                        : AppColors.green600),
              ),
              const SizedBox(
                width: 4,
              ),
              Image.asset(
                "assets/images/logo_coint_emrld.png",
                width: 24,
                fit: BoxFit.fitWidth,
              )
            ],
          )
        ],
      ),
    );
  }
}