import 'package:flutter/cupertino.dart';
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
      required this.pizdulkaUrl});

  final String imageUrl;
  final String textDescription;
  final bool isNew;
  final String pizdulkaUrl;

  List<Widget> _generatePriceItem(List<CoinData> coinsInfo) {
    List<Widget> children = [];

    for (var i in coinsInfo) {
      children.add(PurchaseCondition(data: i));
      children.add(
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
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
      1, (index) => CoinData(imageUrl: 'assets/images/Coins1.png', value: '1,520'));

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 229,
      padding: const EdgeInsets.all(6),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)),
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
                image: DecorationImage(
                    image: AssetImage(imageUrl), fit: BoxFit.cover)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    if (isNew) ...[
                      Container(
                        margin: EdgeInsets.all(6),
                        width: 64,
                        height: 17,
                        alignment: Alignment.center,
                        decoration: ShapeDecoration(
                          color: AppColors.primaryPressedBackground,
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
          Wrap(
            children: _generatePriceItem(hui),
          ),
          SizedBox(
            width: 204,
            height: 30,
            child: Text(
              textDescription,
              style:
                  AppFonts.font12w400.copyWith(color: AppColors.textPrimary),
            ),
          )
        ],
      ),
    );
  }
}
