import 'dart:ffi';



import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:izobility_mobile/widgets/containers/purchase_condition.dart';

import '../../models/api/coinData.dart';
import '../../utils/colors.dart';
import '../../utils/fonts.dart';

class MarketItem extends StatelessWidget {
  MarketItem({super.key, required this.imageUrl, required this.textDescription, required this.maxCount, required this.currentCount});

  final String imageUrl;
  final int maxCount;
  final int currentCount;
  final String textDescription;

  List<Widget> _generatePriceItem(List<CoinData> coinsInfo) {
    List<Widget> children = [];

    for (var i in coinsInfo) {
      children.add(PurchaseCondition(data: i));
      children.add(
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 4),
          child: Text(
            '+',
            style: AppFonts.font12w700.copyWith(color: AppColors.textSecondary),
          ),
        ),
      );
    }
    children.removeLast();
    return children;
  }

  List<CoinData> hui = List.generate(
      3, (index) => CoinData(imageUrl: 'assets/Coins.png', value: '1,520'));

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 216,
      height: 297,
      padding: EdgeInsets.all(6),
      // decoration: ShapeDecoration(
      //   color: AppColors.city,
      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      // ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              width: 204,
              height: 204,
              decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  image: DecorationImage(
                      image: AssetImage(imageUrl), fit: BoxFit.cover))),
          Text('Осталось  $currentCount  из  $maxCount',
              style:
              AppFonts.font8w400.copyWith(color: AppColors.textSecondary, fontSize: 10, )),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 4),
            decoration: ShapeDecoration(
              color: AppColors.purple100,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
            ),
            child: Wrap(
              children: _generatePriceItem(hui),
            ),
          ),
          SizedBox(
            width: 204,
            height: 30,
            child: Text(
              textDescription,
              style: AppFonts.font12w400.copyWith(color: AppColors.textSecondary),
            ),
          )
        ],
      ),
    );
  }
}

