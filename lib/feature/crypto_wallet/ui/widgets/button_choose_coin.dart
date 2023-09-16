import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izobility_mobile/utils/utils.dart';

class ButtonChooseCoin extends StatelessWidget {
  final String coinName;
  final String imagePath;

  const ButtonChooseCoin(
      {super.key, required this.coinName, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 2, color: Colors.black),
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(shape: BoxShape.circle),
              width: 32,
              height: 32,
              alignment: Alignment.center,
              child: SvgPicture.asset(imagePath),
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              coinName,
              style: AppFonts.font16w700.copyWith(color: Colors.black),
            ),
            const SizedBox(
              width: 8,
            ),
            // SvgPicture.asset("assets/icons/бля я хз где оно.svg")
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.black,
              size: 18,
            )
          ],
        ),
      ),
    );
  }
}
