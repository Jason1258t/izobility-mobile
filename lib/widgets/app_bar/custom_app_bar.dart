import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izobility_mobile/utils/ui/fonts.dart';

import '../../utils/ui/colors.dart';

class CustomAppBar extends AppBar {
  CustomAppBar(
      {super.key,
      required context,
      required String text,
      required Function() onTap,
      required bool isBack,
      Color backgroundColor = Colors.white})
      : super(
          surfaceTintColor: Colors.transparent,
          titleSpacing: 12,
          backgroundColor: backgroundColor,
          centerTitle: true,
          leading: isBack
              ? InkWell(
                  onTap: onTap,
                  child: Container(
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        "assets/icons/back.svg",
                        width: 24,
                        height: 24,
                      )),
                )
              : null,
          title: Text(
            text,
            style: AppFonts.font16w700.copyWith(color: Colors.black),
          ),
        );
}
