import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:izobility_mobile/localization/app_localizations.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/utils/ui/fonts.dart';

class StoreItemQuantityContainer extends StatelessWidget {
  final int itemsLost;
  final int itemsAll;

  const StoreItemQuantityContainer({
    super.key, required this.itemsLost, required this.itemsAll,
  });

  @override
  Widget build(BuildContext context) {
    final localize = AppLocalizations.of(context)!;

    return Text(
      "${localize.remain} $itemsLost",
      style: AppTypography.font12w400.copyWith(color: AppColors.grey500),
    );
  }
}