import 'package:flutter/cupertino.dart';
import 'package:izobility_mobile/widgets/containers/purchase_condition.dart';

import '../../models/api/coinData.dart';
import '../../utils/colors.dart';
import '../../utils/fonts.dart';

class MarketItem extends StatelessWidget {
  MarketItem(
      {super.key,
      required this.imageUrl,
      required this.textDescription,
      required this.maxCount,
      required this.currentCount,
      required this.isNew,
      required this.pizdulkaUrl});

  final String imageUrl;
  final int maxCount;
  final int currentCount;
  final String textDescription;
  final bool isNew;
  final String pizdulkaUrl;

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

  final List<CoinData> hui = List.generate(
      3, (index) => CoinData(imageUrl: 'assets/Coins.png', value: '1,520'));

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 216,
      height: 297,
      padding: const EdgeInsets.all(6),
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
                    image: AssetImage(imageUrl), fit: BoxFit.cover)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    if (isNew) ...[
                      Container(
                        width: 64,
                        height: 17,
                        alignment: Alignment.center,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFEB2121),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Text(
                          'НОВОЕ',
                          style: AppFonts.font12w400,
                        ),
                      )
                    ]
                  ],
                ),
                Row(
                  children: [
                    const Spacer(),
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            fit: BoxFit.cover, image: AssetImage(pizdulkaUrl)),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Text('Осталось  $currentCount  из  $maxCount',
              style: AppFonts.font8w400.copyWith(
                color: AppColors.textSecondary,
                fontSize: 10,
              )),
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
              style:
                  AppFonts.font12w400.copyWith(color: AppColors.textSecondary),
            ),
          )
        ],
      ),
    );
  }
}
