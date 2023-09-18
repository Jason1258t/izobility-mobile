import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/utils.dart';

class ButtonSwop extends StatelessWidget {
  final Function onTap;

  const ButtonSwop({
    super.key, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.purple600,
      borderRadius: BorderRadius.circular(100),
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: () {
          onTap();
        },
        child: Container(
          width: 56,
          height: 56,
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset("assets/icons/swap.svg", color: Colors.white,),
        ),
      ),
    );
  }
}
