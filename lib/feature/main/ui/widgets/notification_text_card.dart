import 'package:flutter/material.dart';
import 'package:izobility_mobile/feature/main/ui/widgets/notification_card_container.dart.dart';
import 'package:izobility_mobile/models/notifications/notification_model.dart';
import 'package:izobility_mobile/utils/enum/notification_category.dart';
import 'package:izobility_mobile/utils/enum/notification_position.dart';
import 'package:izobility_mobile/utils/utils.dart';


class NotificationTextCard extends StatelessWidget {
  final NotificationModel data;
  final NotificationPosition pose;

  const NotificationTextCard({super.key, required this.data, required this.pose});

  @override
  Widget build(BuildContext context) {
    return NotificationCardContainer(
        pose: pose,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    "${data.type == NotificationTransactionType.get ? "Продажа товара в" : "Получен  товар в"}  ${data.name.toUpperCase()}",
                    style: AppFonts.font14w700.copyWith(
                      color: AppColors.grey700,
                    ),
                    softWrap: true,
                  ),
                ),
                Text(
                  "${data.time.hour}:${data.time.minute}",
                  style: AppFonts.font12w400
                      .copyWith(color: AppColors.blackGraySecondary),
                )
              ],
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              data.description,
              style: AppFonts.font12w400
                  .copyWith(color: AppColors.blackGraySecondary),
            )
          ],
        ));
  }
}