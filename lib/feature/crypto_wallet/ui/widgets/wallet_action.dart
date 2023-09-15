import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/utils/ui/fonts.dart';

class WalletAction extends StatelessWidget {
  const WalletAction({required this.title, required this.icon});

  final String title;
  final SvgPicture icon;

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);

    return Column(
      children: [
        Container(
          width: sizeOf.width * 0.156,
          height: sizeOf.width * 0.156,
          decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () {},
            icon: icon,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          title,
          style: AppFonts.font12w700.copyWith(color: AppColors.primary),
        ),
      ],
    );
  }
}