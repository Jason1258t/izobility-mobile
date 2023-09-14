import 'package:flutter/material.dart';
import 'package:izobility_mobile/feature/main/ui/widgets/chip_category_card.dart';
import 'package:izobility_mobile/feature/main/ui/widgets/date_container.dart';
import 'package:izobility_mobile/feature/main/ui/widgets/notification_card.dart';
import 'package:izobility_mobile/utils/enum/notification_position.dart';
import 'package:izobility_mobile/utils/utils.dart';
import 'package:izobility_mobile/widgets/scaffold/home_scaffold.dart';
import 'package:sliver_tools/sliver_tools.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      appBar: AppBar(title: Text("notes")),
      body: Container(
        color: AppColors.backgroundGrey,
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: ChipsCategoryList(),
            ),
            getWidgets(Colors.red),
            getWidgets(Colors.blue),
            getWidgets(Colors.purple)
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
            child: DateText(date: "март 41",)),
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
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Row(
      children: [
        ChipCategoryCard(
          text: "Все",
          isActive: true,
        ),
        ChipCategoryCard(
          text: "Попы",
          isActive: false,
        ),
      ],
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
