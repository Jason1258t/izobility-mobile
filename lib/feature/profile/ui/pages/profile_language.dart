import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/feature/profile/data/user_repository.dart';
import 'package:izobility_mobile/feature/profile/ui/widgets/profile_text_with_checkbox.dart';
import 'package:izobility_mobile/localization/app_localizations.dart';
import 'package:izobility_mobile/main.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_app_bar.dart';

class ProfileLanguageScreen extends StatefulWidget {
  const ProfileLanguageScreen({super.key});

  @override
  State<ProfileLanguageScreen> createState() => _ProfileLanguageScreenState();
}

class _ProfileLanguageScreenState extends State<ProfileLanguageScreen> {
  Locale locale = const Locale('en');

  @override
  Widget build(BuildContext context) {
    locale = Locale(AppLocalizations.of(context)!.localeName);

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.purpleBcg,
          appBar: CustomAppBar(
            context: context,
            text: "Смена языка",
            isBack: true,
            onTap: () {
              context.pop();
            },
          ),
          body: Column(
            children: [
              TextWithCheckBox(
                value: locale.languageCode == 'ru',
                onTap: (bool? b) {
                  MyApp.setLocale(context, const Locale('ru'));
                  setState(() {});
                },
                title: 'Русский',
              ),
              TextWithCheckBox(
                value: locale.languageCode == 'en',
                onTap: (bool? b) {
                  MyApp.setLocale(context, const Locale('en'));
                  setState(() {});
                },
                title: 'English',
              ),
              TextWithCheckBox(
                value: locale.languageCode == 'es',
                onTap: (bool? b) {
                  MyApp.setLocale(context, const Locale('es'));
                  setState(() {});
                },
                title: 'Spanish',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
