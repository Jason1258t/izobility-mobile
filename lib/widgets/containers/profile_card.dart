import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../utils/utils.dart';
class ProfileCard extends StatelessWidget {
  final String  name;
  final String status;
  final String imageUrl;

  const ProfileCard(
      {super.key,
        required this.imageUrl,
        required this.name,
        required this.status});

  @override
  Widget build(BuildContext context) {
    return  Stack(
        children:[ Container(
          width: double.infinity,
          height: 88,
          padding: const EdgeInsets.all(12),
          decoration: ShapeDecoration(
            color: AppColors.backgroundContent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Row(children: [
            CircleAvatar(backgroundImage: NetworkImage(imageUrl),radius: 32,),
            const SizedBox(width: 10,),
            Column( mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,style: AppFonts.font16w500.copyWith(color: AppColors.textPrimary ,)),
                const SizedBox(height: 2,),
                Text(status,style: AppFonts.font12w400.copyWith(color: AppColors.textPrimary ),)
              ],),
            const Expanded(child: SizedBox()),
          ],),
        ),
          Positioned( right: 5, bottom: 5,
              child: IconButton(onPressed: (){},
                icon: SvgPicture.asset('assets/icons/edit.svg',width: 24,color:AppColors.lightGreyIcon),iconSize: 48,)),
        ]);

  }
}
