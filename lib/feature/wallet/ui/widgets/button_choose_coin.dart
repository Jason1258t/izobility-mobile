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
    return Container(
      padding: EdgeInsets.zero,
      alignment: Alignment.centerLeft,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 2, color: Colors.black),
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        onPressed: () {},
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
