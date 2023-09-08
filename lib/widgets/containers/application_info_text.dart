import 'package:flutter/material.dart';
import 'package:izobility_mobile/utils/colors.dart';
import 'package:izobility_mobile/utils/fonts.dart';

class ApplicationInfoText extends StatelessWidget {
  const ApplicationInfoText(
      {Key? key, required this.paramName, required this.paramValue})
      : super(key: key);

  final String paramName;
  final String paramValue;

  final String points =
      ".........................................................................................................................";

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          paramName,
          textAlign: TextAlign.left,
          style: AppFonts.font12w400.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        Flexible(
          child: Text(
            points,
            maxLines: 1,
            overflow: TextOverflow.clip,
            style: AppFonts.font14w400.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
        Text(
          paramValue,
          textAlign: TextAlign.right,
          style: AppFonts.font12w400.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
