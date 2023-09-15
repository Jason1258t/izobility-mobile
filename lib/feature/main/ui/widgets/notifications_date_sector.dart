import 'package:flutter/material.dart';
import 'package:izobility_mobile/feature/main/ui/widgets/date_container.dart';
import 'package:izobility_mobile/feature/main/ui/widgets/notification_coin_card.dart';
import 'package:izobility_mobile/feature/main/ui/widgets/notification_text_card.dart';
import 'package:izobility_mobile/models/notifications/notification_model.dart';
import 'package:izobility_mobile/utils/constants.dart';
import 'package:izobility_mobile/utils/enum/notification_position.dart';
import 'package:sliver_tools/sliver_tools.dart';

class NotificationsDateSector extends StatelessWidget {
  final List<dynamic> cards;
  final DateTime date;

  const NotificationsDateSector({super.key, required this.cards, required this.date});

  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      pushPinnedChildren: true,
      children: [
         SliverPinnedHeader(
            child: DateText(
          date: "${date.day} ${monthes[date.month.toString()]}",
        )),
        SliverList.separated(
            itemCount: cards.length,
            separatorBuilder: (context, index) => const SizedBox(
                  height: 5,
                ),
            itemBuilder: (context, index) {
              NotificationPosition cardPose = NotificationPosition.mid;
              final item = cards[index];
              if (index == 0) {
                cardPose = NotificationPosition.start;
              } else if (index == cards.length - 1) {
                cardPose = NotificationPosition.end;
              }

              if (item is NotificationModel) {
                return NotificationTextCard(
                  pose: cardPose,
                  data: cards[index],
                );
              } else {
                return NotificationCoinCard(
                  pose: cardPose,
                  data: cards[index],
                );
              }
            }),
      ],
    );
  }
}
