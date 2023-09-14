import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izobility_mobile/utils/fonts.dart';

import '../../utils/colors.dart';

class CustomAppBar extends AppBar {
  CustomAppBar(
      {super.key, required context, required String text, required bool isBack})
      : super(
          surfaceTintColor: Colors.transparent,
          titleSpacing: 12,
          backgroundColor: AppColors.backgroundContent,
          leading: isBack
              ? InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
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
