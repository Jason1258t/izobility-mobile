import 'package:flutter/material.dart';
import 'package:izobility_mobile/feature/profile/ui/profile.dart';
import 'package:izobility_mobile/utils/fonts.dart';
import 'package:izobility_mobile/utils/utils.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_app_bar.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(context: context, text: "Редактирование профиля"),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ProfileCard()),
                ProfileAspect(
                  label: "Имя",
                  text: "Сосунок",
                ),
                ProfileAspect(
                  label: "Ник",
                  text: "anus132",
                ),
                ProfileAspect(
                  label: "Фамилия",
                  text: "Нагиботоров",
                ),
                ProfileAspect(
                  label: "Пол",
                  text: "ламинат жесткий",
                ),
                ProfileAspect(
                  label: "Дата рождения",
                  text: "19.12.2005",
                ),
                ProfileAspect(
                  label: "Телефон",
                  text: "8 800 555 35 35",
                ),
                ProfileAspect(
                  label: "Почта",
                  text: "fuckmy@ass.ru",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileAspect extends StatefulWidget {
  final String label;
  final String text;

  const ProfileAspect({super.key, required this.label, required this.text});

  @override
  State<ProfileAspect> createState() => _ProfileAspectState();
}

class _ProfileAspectState extends State<ProfileAspect> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.label,
              style: AppFonts.font16w500.copyWith(color: AppColors.textPrimary),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(widget.text,
                style: AppFonts.font12w400
                    .copyWith(color: AppColors.textSecondary))
          ],
        ),
      ),
    );
  }
}
