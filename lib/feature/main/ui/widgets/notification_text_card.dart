import 'package:flutter/material.dart';
import 'package:izobility_mobile/feature/main/ui/widgets/notification_card_container.dart.dart';
import 'package:izobility_mobile/models/notifications/notification_model.dart';
import 'package:izobility_mobile/utils/logic/enums.dart';
import 'package:izobility_mobile/utils/utils.dart';


class NotificationTextCard extends StatelessWidget {
  final NotificationModel data;
  final NotificationPositionEnum pose;

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
                    "Добро пожаловать в ${data.name.toUpperCase()}!",
                    style: AppTypography.font14w700.copyWith(
                      color: AppColors.grey700,
                    ),
                    softWrap: true,
                  ),
                ),
                Text(
                  "${data.time.hour}:${data.time.minute}",
                  style: AppTypography.font12w400
                      .copyWith(color: AppColors.blackGraySecondary),
                )
              ],
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              data.description,
              style: AppTypography.font12w400
                  .copyWith(color: AppColors.blackGraySecondary),
            )
          ],
        ));
  }
}