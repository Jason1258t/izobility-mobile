import 'package:flutter/material.dart';
import 'package:izobility_mobile/feature/store/ui/widgets/product_coin_price_container.dart';
import 'package:izobility_mobile/localization/app_localizations.dart';
import 'package:izobility_mobile/models/market_item.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/utils/ui/fonts.dart';

class StorePriceContainer extends StatelessWidget {
  final MarketItemModel marketItem;

  const StorePriceContainer({
    super.key,
    required this.marketItem,
  });

  @override
  Widget build(BuildContext context) {
    final localize = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.primary, borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Text(
            localize.it_nesessary_to_get_it,
            style: AppTypography.font18w700.copyWith(color: Colors.white),
          ),
          const SizedBox(
            height: 16,
          ),
          ProductCoinPriceContainer(
            width: double.infinity,
            imagePath: marketItem.coin.imageUrl,
            quantity: marketItem.price,
          ),
        ],
      ),
    );
  }
}
