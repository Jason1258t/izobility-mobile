import 'package:flutter/cupertino.dart';

import '../../models/api/coinData.dart';
import '../../utils/colors.dart';
import '../../utils/fonts.dart';

class PurchaseCondition extends StatelessWidget {
  const PurchaseCondition({super.key, required this.data});

  final CoinData data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            data.imageUrl,
            width: 16,
            height: 16,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 2,
          ),
          Text(
            data.value,
            style: AppFonts.font8w700.copyWith(color: AppColors.textPrimary),
          ),
        ],
      ),
    );
  }
}