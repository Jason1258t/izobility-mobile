import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izobility_mobile/utils/fonts.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({super.key, required context, required String text})
      : super(
          titleSpacing: 12,
          leading: InkWell(
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
          ),
          title: Text(
            text,
            style: AppFonts.font16w700.copyWith(color: Colors.black),
          ),
        );
}
