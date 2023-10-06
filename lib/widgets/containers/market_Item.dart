import 'package:flutter/material.dart';
import 'package:izobility_mobile/localization/app_localizations.dart';
import 'package:izobility_mobile/widgets/containers/purchase_condition.dart';

import '../../models/api/coin_data.dart';
import '../../utils/ui/colors.dart';
import '../../utils/ui/fonts.dart';

class MarketItem extends StatelessWidget {
  MarketItem(
      {super.key,
      required this.imageUrl,
      required this.textDescription,
      required this.isNew,
      required this.onTap,
      required this.pizdulkaUrl,
      this.coinData});

  final String imageUrl;
  final String textDescription;
  final bool isNew;
  final String pizdulkaUrl;
  final List<CoinData>? coinData;
  final VoidCallback onTap;

  List<Widget> _generatePriceItem(List<CoinData> coinsInfo) {
    if(coinsInfo.isEmpty)  return [];

    List<Widget> children = [];

    for (var i in coinsInfo) {
      children.add(PurchaseCondition(data: i));
      children.add(
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
          child: Text(
            '+',
            style: AppTypography.font12w700
                .copyWith(color: AppColors.textSecondary),
          ),
        ),
      );
    }
    children.removeLast();
    return children;
  }

  @override
  Widget build(BuildContext context) {
    final localize = AppLocalizations.of(context)!;

    return InkWell(
      onTap: onTap,
      child: Container(
        width: (MediaQuery.of(context).size.width - 40) / 2,
        height: (MediaQuery.of(context).size.width - 40) / 2 * 160 / 240,
        padding: const EdgeInsets.all(6),
        decoration: ShapeDecoration(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: (MediaQuery.of(context).size.width - 40) / 2,
              height: (MediaQuery.of(context).size.width - 28) / 2,
              decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  color: Colors.grey[300],
                  image: DecorationImage(
                      image: NetworkImage(imageUrl), fit: BoxFit.cover)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      if (isNew) ...[
                        Container(
                          margin: const EdgeInsets.all(6),
                          width: 64,
                          height: 17,
                          alignment: Alignment.center,
                          decoration: ShapeDecoration(
                            color: AppColors.primary,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: Text(
                            localize.new_,
                            style: AppTypography.font12w400,
                          ),
                        )
                      ]
                    ],
                  ),
                ],
              ),
            ),
            Wrap(
              children: _generatePriceItem(coinData ?? []),
            ),
            Text(
              textDescription,
              maxLines: 2,
              style: AppTypography.font12w400
                  .copyWith(color: AppColors.textPrimary),
            )
          ],
        ),
      ),
    );
  }
}
