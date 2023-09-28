import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:izobility_mobile/feature/store/ui/pages/promo_screen.dart';
import 'package:izobility_mobile/feature/store/ui/widgets/product_coin_card.dart';
import 'package:izobility_mobile/feature/store/ui/widgets/product_coin_price_container.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/utils/ui/fonts.dart';

class StorePriceContainer extends StatelessWidget {
  

  const StorePriceContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Text(
            "Для получение необходимо",
            style: AppTypography.font18w700
                .copyWith(color: Colors.white),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProductCoinPriceContainer(
                width: (MediaQuery.sizeOf(context).width - 72) * 0.5,
                imagePath: 'assets/icons/coin.svg',
                quantity: 1235.92,
              ),
              ProductCoinPriceContainer(
                width: (MediaQuery.sizeOf(context).width - 72) * 0.5,
                imagePath: 'assets/icons/coin.svg',
                quantity: 1235.92,
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          ProductCoinPriceContainer(
            width: double.infinity,
            imagePath: 'assets/icons/coin.svg',
            quantity: 1235.92,
          ),
        ],
      ),
    );
  }
}

