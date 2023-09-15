import 'package:flutter/material.dart';
import 'package:izobility_mobile/feature/main/ui/widgets/chip_category_card.dart';
import 'package:izobility_mobile/utils/utils.dart';

class ChipsCategoryList extends SliverPersistentHeaderDelegate {
  List<String> name = [
    'Все',
    'Покупка',
    'Продажа',
    'Акция',
    '123',
    '312',
    'sdfsdf',
  ];
  int currentIndex = 0;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      alignment: Alignment.bottomLeft,
      height: double.infinity,
      color: AppColors.purpleBcg,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        itemBuilder: ((context, index) => ChipCategoryCard(
              text: name[index],
              isActive: currentIndex == index,
            )),
        itemCount: name.length,
      ),
    );
  }

  @override
  double get maxExtent => 28;

  @override
  double get minExtent => 28;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}