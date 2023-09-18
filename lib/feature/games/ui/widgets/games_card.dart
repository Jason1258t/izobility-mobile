import 'package:flutter/material.dart';
import 'package:izobility_mobile/models/game.dart';
import 'package:izobility_mobile/utils/utils.dart';

class GamesCard extends StatefulWidget {
  final GameModel game;

  const GamesCard({super.key, required this.game});

  @override
  State<GamesCard> createState() => GamesCardState();
}

class GamesCardState extends State<GamesCard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Container(
      color: Colors.transparent,
      height: 64,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(8)),
          ),
          const SizedBox(
            width: 8,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: size.width * 0.4,
                child: Text(
                  widget.game.name,
                  style: AppFonts.font16w400.copyWith(color: Colors.black),
                ),
              ),
              Row(
                children: [
                  Text(
                    widget.game.grade.toString(),
                    style:
                        AppFonts.font12w400.copyWith(color: AppColors.grey500),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  const Icon(
                    Icons.grade_rounded,
                    size: 12,
                    color: AppColors.grey500,
                  )
                ],
              )
            ],
          ),
          Spacer(),
          Align(
            alignment: Alignment.centerRight,
            child: Material(
                color: AppColors.purple200,
                borderRadius: BorderRadius.circular(8),
                child: InkWell(
                    onTap: () {
                      // TODO redirect to games details screen
                    },
                    borderRadius: BorderRadius.circular(8),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      child: Text(
                        'Скачать',
                        style:
                            AppFonts.font12w400.copyWith(color: Colors.black),
                      ),
                    ))),
          )
        ],
      ),
    );
  }
}
