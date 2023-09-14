import 'package:flutter/material.dart';
import 'package:izobility_mobile/feature/main/ui/widgets/chip_category_card.dart';
import 'package:izobility_mobile/feature/main/ui/widgets/date_container.dart';
import 'package:izobility_mobile/feature/main/ui/widgets/notification_card.dart';
import 'package:izobility_mobile/utils/enum/notification_position.dart';
import 'package:izobility_mobile/utils/utils.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:izobility_mobile/widgets/scaffold/home_scaffold.dart';
import 'package:sliver_tools/sliver_tools.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      appBar: CustomAppBar(
        isBack: true,
        text: 'Уведомления',
        context: context,
      ),
      body: Container(
        color: AppColors.purpleBcg,
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              floating: true,
              delegate: ChipsCategoryList(),
            ),
            getWidgets(Colors.red),
            getWidgets(Colors.blue),
            getWidgets(Colors.purple),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 30,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getWidgets(Color color) {
    return MultiSliver(
      pushPinnedChildren: true,
      children: [
        SliverPinnedHeader(
            child: DateText(
          date: "март 41",
        )),
        SliverList.separated(
            itemCount: 3,
            separatorBuilder: (context, index) => const SizedBox(
                  height: 5,
                ),
            itemBuilder: (context, index) {
              NotificationPosition cardPose = NotificationPosition.mid;

              if (index == 0) {
                cardPose = NotificationPosition.start;
              } else if (index == 3 - 1) {
                cardPose = NotificationPosition.end;
              }

              return NotificationCard(
                pose: cardPose,
                mainText: "Продажа товара %Название-дилнное очень%",
                time: "21 01",
                subText:
                    "Имеется спорная точка зрения, гласящая примерно следующее: некоторые особенности внутренней политики",
              );
            }),
      ],
    );
  }
}

class ChipsCategoryList extends SliverPersistentHeaderDelegate {
  List<String> name = [
    'Все',
    'Покупка',
    'Продажа',
    'Акция',
    'Акция',
    'Акция',
    'Акция',
    'Акция'
  ];
  int currentIndex = 0;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      padding: const EdgeInsets.only(top: 12, right: 16, left: 16),
      alignment: Alignment.bottomLeft,
      height: double.infinity,
      color: AppColors.purpleBcg,
      child: ListView.separated(
        shrinkWrap: false,
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
  double get maxExtent => 40;

  @override
  double get minExtent => 40;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
