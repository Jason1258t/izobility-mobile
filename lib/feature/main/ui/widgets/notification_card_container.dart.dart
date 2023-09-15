import 'package:flutter/material.dart';
import 'package:izobility_mobile/utils/logic/enum/notification_position.dart';


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
            ? const Icon(
                Icons.pets_rounded,
                size: 28,
              )
            : const SizedBox(
                width: 28,
              ),
        const SizedBox(
          width: 4,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: pose == NotificationPosition.start
                    ? const Radius.circular(16)
                    : const Radius.circular(4),
                topRight: pose == NotificationPosition.start
                    ? const Radius.circular(16)
                    : const Radius.circular(4),
                bottomLeft: pose == NotificationPosition.end
                    ? const Radius.circular(16)
                    : const Radius.circular(4),
                bottomRight: pose == NotificationPosition.end
                    ? const Radius.circular(16)
                    : const Radius.circular(4),
              ),
              color: Colors.white),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          width: MediaQuery.sizeOf(context).width * 0.82222,
          child: child,
        )
      ],
    );
  }
}
