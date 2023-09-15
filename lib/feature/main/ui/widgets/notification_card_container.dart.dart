import 'package:flutter/material.dart';
import 'package:izobility_mobile/utils/enum/notification_position.dart';


class NotificationCardContainer extends StatelessWidget {
  final NotificationPosition pose;
  final Widget child;

  const NotificationCardContainer(
      {super.key, required this.child, required this.pose});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        pose == NotificationPosition.end
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
                topLeft: pose == NotificationPosition.start
                    ? Radius.circular(16)
                    : Radius.circular(4),
                topRight: pose == NotificationPosition.start
                    ? Radius.circular(16)
                    : Radius.circular(4),
                bottomLeft: pose == NotificationPosition.end
                    ? Radius.circular(16)
                    : Radius.circular(4),
                bottomRight: pose == NotificationPosition.end
                    ? Radius.circular(16)
                    : Radius.circular(4),
              ),
              color: Colors.white),
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          width: MediaQuery.sizeOf(context).width * 0.82222,
          child: child,
        )
      ],
    );
  }
}
