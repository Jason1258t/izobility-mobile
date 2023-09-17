import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:izobility_mobile/utils/ui/fonts.dart';

class ChooseCoinCard extends StatelessWidget {
  final String name;
  final String coinPath;
  final Function onTap;
  final String amount;

  const ChooseCoinCard(
      {super.key,
      required this.name,
      required this.coinPath,
      required this.onTap,
      required this.amount});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(16),
      color: Colors.white,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          onTap();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  padding: const EdgeInsets.all(8),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      color: Colors.black, shape: BoxShape.circle),
                  child: SvgPicture.asset(coinPath)),
              const SizedBox(
                width: 12,
              ),
              Text(
                name,
                style: AppFonts.font16w400.copyWith(color: Colors.black),
              ),
              Spacer(),
              Text(
                amount,
                style: AppFonts.font18w700.copyWith(color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}
