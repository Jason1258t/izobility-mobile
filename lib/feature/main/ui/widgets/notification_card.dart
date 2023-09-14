import 'package:flutter/material.dart';
import 'package:izobility_mobile/utils/enum/notification_position.dart';
import 'package:izobility_mobile/utils/utils.dart';

class NotificationCard extends StatefulWidget {
  final String time;
  final String mainText;
  final String subText;

  final NotificationPosition pose;

  const NotificationCard(
      {super.key,
      required this.time,
      required this.mainText,
      required this.subText,
      required this.pose});

  @override
  State<NotificationCard> createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        widget.pose == NotificationPosition.end
            ? Icon(
                Icons.pets_rounded,
                size: 28,
              )
            : SizedBox(
                width: 28,
              ),
        const SizedBox(
          width: 4,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: widget.pose == NotificationPosition.start
                    ? Radius.circular(16)
                    : Radius.circular(4),
                topRight: widget.pose == NotificationPosition.start
                    ? Radius.circular(16)
                    : Radius.circular(4),
                bottomLeft: widget.pose == NotificationPosition.end
                    ? Radius.circular(16)
                    : Radius.circular(4),
                bottomRight: widget.pose == NotificationPosition.end
                    ? Radius.circular(16)
                    : Radius.circular(4),
              ),
              color: Colors.white),
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          width: MediaQuery.sizeOf(context).width * 0.82222,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      widget.mainText,
                      style: AppFonts.font14w700.copyWith(
                        color: AppColors.grey700,
                      ),
                      softWrap: true,
                    ),
                  ),
                  Text(
                    widget.time,
                    style: AppFonts.font12w400
                        .copyWith(color: AppColors.blackGraySecondary),
                  )
                ],
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                widget.subText,
                style: AppFonts.font12w400
                    .copyWith(color: AppColors.blackGraySecondary),
              )
            ],
          ),
        )
      ],
    );
  }
}
