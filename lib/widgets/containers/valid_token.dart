import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../utils/utils.dart';
class ValidToken extends StatelessWidget {
  final String title;
  final String subtitle;
  final String value;
  final String imageUrl;

  final VoidCallback onTap;

  const ValidToken(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.value,
      required this.imageUrl,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: ()=> onTap(),
      child:  Container(
        width: double.infinity,
        height: 60,
        decoration: ShapeDecoration( color: AppColors.textContrast,
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),)),
        child: Row( children: [
          const Padding(padding: EdgeInsets.only(left:17)),
          Container(
            width: 32,
            height: 32,
            padding: const EdgeInsets.all(4),
            decoration: ShapeDecoration(
              color: AppColors.backgroundSecondary,
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
              ),),
            child: Container(
              width: 24,
              height: 24,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageUrl), ),
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.84),)))),
            const SizedBox(width: 12,),
            Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,style: AppFonts.font12w700.copyWith(color: AppColors.textPrimary),),
                Text(subtitle,style: AppFonts.font12w400.copyWith(color: AppColors.textTertiary),)],),
              const Expanded(child: SizedBox()),
              Text(value, style:AppFonts.font16w700.copyWith(color: AppColors.textSecondary)),
              const Padding(padding: EdgeInsets.only(right:17)),],),),
    );

  }
}
