import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:izobility_mobile/utils/ui/fonts.dart';

class ProductCoinCard extends StatelessWidget {
  const ProductCoinCard({
    super.key,
    required this.imagePath,
    required this.quantity,
  });

  final String imagePath;
  final double quantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network("https://api.z-boom.ru/media/" +
            "moneta/22aca8bb1a77d571aff193a7dcb6d2d1.jpg", width: 27,),
        const SizedBox(
          width: 6,
        ),
        Text(
          quantity.toString(),
          style: AppTypography.font14w700.copyWith(color: Colors.black),
        )
      ],
    );
  }
}
