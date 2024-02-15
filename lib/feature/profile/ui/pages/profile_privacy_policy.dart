import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/localization/app_localizations.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/utils/ui/fonts.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_app_bar.dart';

class ProfilePrivacyPolicyScreen extends StatefulWidget {
  const ProfilePrivacyPolicyScreen({super.key});

  @override
  State<ProfilePrivacyPolicyScreen> createState() =>
      _ProfilePrivacyPolicyScreenState();
}

class _ProfilePrivacyPolicyScreenState
    extends State<ProfilePrivacyPolicyScreen> {
  String policy = '';

  void preloadPolicy() async {
    policy =
        await rootBundle.loadString('assets/privacy_policy/privacy_policy.txt');
    setState(() {});
  }

  @override
  void initState() {
    preloadPolicy();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final localize = AppLocalizations.of(context)!;

    return Container(
      color: Colors.white,
      child: Scaffold(
          backgroundColor: AppColors.purpleBcg,
          appBar: CustomAppBar(
            context: context,
            text: localize.privacy_policy,
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
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 70,
                    child: SvgPicture.asset(
                      "assets/icons/top page navigation.svg",
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    policy,
                    style:
                        AppTypography.font14w400.copyWith(color: Colors.black),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
