import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/feature/profile/ui/widgets/profile_aspect.dart';
import 'package:izobility_mobile/feature/profile/ui/widgets/profile_card.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:izobility_mobile/widgets/scaffold/home_scaffold.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      appBar: CustomAppBar(
        context: context,
        text: "Редактирование профиля",
        isBack: true,
        onTap: () {
          context.pop();
        },
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: const ProfileCard()),
              const ProfileAspect(
                label: "Имя",
                text: "Сосунок",
              ),
              const ProfileAspect(
                label: "Ник",
                text: "anus132",
              ),
              const ProfileAspect(
                label: "Фамилия",
                text: "Нагиботоров",
              ),
              const ProfileAspect(
                label: "Пол",
                text: "ламинат жесткий",
              ),
              const ProfileAspect(
                label: "Дата рождения",
                text: "19.12.2005",
              ),
              const ProfileAspect(
                label: "Телефон",
                text: "8 800 555 35 35",
              ),
              const ProfileAspect(
                label: "Почта",
                text: "fuckmy@ass.ru",
              )
            ],
          ),
        ),
      ),
    );
  }
}
