import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/utils/colors.dart';
import 'package:izobility_mobile/utils/fonts.dart';
import 'package:izobility_mobile/utils/route_names.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:izobility_mobile/widgets/containers/profile/profile_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          context: context,
          text: "Профиль",
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(16).copyWith(bottom: 0),
                color: AppColors.backgroundSecondary,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                        padding: const EdgeInsets.all(12).copyWith(right: 19),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ProfileCard(),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/edit.svg',
                                    color: AppColors.lightGreyIcon,
                                    width: 24,
                                    height: 24,
                                  ),
                                  Positioned.fill(
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: () {
                                          context.push(RouteNames.profileEdit);
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 16,
                    ),
                    const ButtonActivate(),
                    const SizedBox(
                      height: 16,
                    ),
                    const Wrap(
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.spaceBetween,
                      runAlignment: WrapAlignment.start,
                      runSpacing: 10,
                      children: [
                        ProfileActionContainer(),
                        ProfileActionContainer(),
                        ProfileActionContainer()
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16).copyWith(bottom: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.music_note_sharp),
                          const SizedBox(width: 20,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Busi acc oao',
                                style: AppFonts.font16w500
                                    .copyWith(color: AppColors.textPrimary),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'description',
                                style: AppFonts.font12w400
                                    .copyWith(color: AppColors.textSecondary),
                              )
                            ],
                          ),
                          const Spacer(),
                          Switch.adaptive(value: false, onChanged: (v) {})
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileActionContainer extends StatefulWidget {
  const ProfileActionContainer({
    super.key,
  });

  @override
  State<ProfileActionContainer> createState() => _ProfileActionContainerState();
}

class _ProfileActionContainerState extends State<ProfileActionContainer> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8.0),
        onTap: () {},
        child: Container(
          constraints: const BoxConstraints(minHeight: 140),
          alignment: Alignment.topLeft,
          width: MediaQuery.sizeOf(context).width * 0.44444,
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'fuck my ass bih',
                style: AppFonts.font16w700.copyWith(color: Colors.black),
              ),
              const SizedBox(
                height: 12,
              ),
              Text('additionaol text',
                  style: AppFonts.font11w400.copyWith(color: Colors.black)),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonActivate extends StatelessWidget {
  const ButtonActivate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.darkBlue, width: 1),
            borderRadius: BorderRadius.circular(8)),
        child: Text(
          "Активировать промокод",
          style: AppFonts.font18w600.copyWith(color: AppColors.darkBlue),
        ),
      ),
    );
  }
}
