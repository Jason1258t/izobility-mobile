import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:izobility_mobile/feature/store/ui/pages/promo_screen.dart';
import 'package:izobility_mobile/feature/store/ui/widgets/product_coin_card.dart';
import 'package:izobility_mobile/utils/ui/fonts.dart';

class ProductCoinPriceContainer extends StatelessWidget {
  final String imagePath;
  final double width;
  final double quantity;

  const ProductCoinPriceContainer({
    super.key,
    required this.imagePath,
    required this.quantity,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 9),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: ProductCoinCard(imagePath: imagePath, quantity: quantity),
    );
  }
}
