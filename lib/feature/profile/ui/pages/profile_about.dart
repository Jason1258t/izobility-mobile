import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/localization/app_localizations.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/utils/ui/fonts.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:izobility_mobile/widgets/button/custom_text_button.dart';
import 'package:izobility_mobile/widgets/scaffold/home_scaffold.dart';

class ProfileAppAboutScreen extends StatefulWidget {
  const ProfileAppAboutScreen({super.key});

  @override
  State<ProfileAppAboutScreen> createState() => _ProfileAppAboutScreenState();
}

class _ProfileAppAboutScreenState extends State<ProfileAppAboutScreen> {
  @override
  Widget build(BuildContext context) {
    final localize = AppLocalizations.of(context)!;

    return Container(
      color: Colors.white,
      child: Scaffold(
          backgroundColor: AppColors.purpleBcg,
          appBar: CustomAppBar(
            context: context,
            text: localize.about_app,
            isBack: true,
            onTap: () {
              context.pop();
            },
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 16,),
                  Container(
                    alignment: Alignment.center,
                    height: 70,
                    child: Image.asset("assets/images/logo.png", fit: BoxFit.fitHeight,),
                  ),
                  const SizedBox(height: 32,),
                  Text(
                    localize.welcome_to_emerald,
                    style: AppTypography.font14w400.copyWith(color: Colors.black),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
