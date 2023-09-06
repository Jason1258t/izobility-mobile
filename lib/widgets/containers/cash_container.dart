import 'package:flutter/cupertino.dart';
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
        width: 89.33,
        height: 32,
        decoration: ShapeDecoration(
          color: AppColors.backgroundContent,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 0.50, color: AppColors.border),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          children: [
            const Padding(padding: EdgeInsets.only(left: 10)),
            SvgPicture.asset(
              assetName,
              width: 21.33,
            ),
            const SizedBox(
              width: 7,
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
