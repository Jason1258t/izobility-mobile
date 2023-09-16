import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:izobility_mobile/utils/ui/fonts.dart';

class ChooseCoinCard extends StatelessWidget {
  final String name;

  final String coinPath;

  const ChooseCoinCard({super.key, required this.name, required this.coinPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16)
      ),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle
              ),
              child: SvgPicture.asset(coinPath)),
          const SizedBox(width: 12,),
          Text(
            name,
            style: AppFonts.font16w400.copyWith(color: Colors.black),
          ),
          Spacer(),
          IconButton(
              onPressed: () {
                Navigator.pop(context); // TODO REFACTOR THIS IMMIDEATELY
              },
              icon: const Icon(Icons.add, color: Colors.black, size: 20,))
        ],
      ),
    );
  }
}
