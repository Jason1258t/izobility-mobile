import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/feature/profile/ui/widgets/profile_aspect.dart';
import 'package:izobility_mobile/feature/profile/ui/widgets/profile_card.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:izobility_mobile/widgets/popup/popup_logout.dart';
import 'package:izobility_mobile/widgets/scaffold/home_scaffold.dart';
import 'package:izobility_mobile/widgets/text_field/custom_text_field.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.purpleBcg,
            appBar: CustomAppBar(
              actions: [
                Material(
                  child: InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: ((context) => PopupChoose(
                              label: "Сохранить изменения?",
                              description: "Иначе вы потеряете введенные вами изменения",
                              onAccept: () {},
                              onDecline: () => context.pop())));
                    },
                    child: Container(
                        width: 45,
                        height: double.infinity,
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.check,
                          size: 25,
                          weight: 700,
                        )),
                  ),
                )
              ],
              context: context,
              text: "Редактирование профиля",
              isBack: true,
              onTap: () {
                context.pop();
              },
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(16).copyWith(bottom: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomTextField(
                        backgroundColor: Colors.white,
                        labelText: "Имя",
                        hintText: "Имя",
                        controller: _nameController,
                        width: double.infinity),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                        backgroundColor: Colors.white,
                        labelText: "Фамилия",
                        hintText: "Фамилия",
                        controller: _nameController,
                        width: double.infinity),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                        backgroundColor: Colors.white,
                        labelText: "Почта",
                        hintText: "Почта",
                        controller: _nameController,
                        width: double.infinity),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                        backgroundColor: Colors.white,
                        labelText: "Пол",
                        hintText: "Пол",
                        controller: _nameController,
                        width: double.infinity),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                        backgroundColor: Colors.white,
                        labelText: "Дата рождения",
                        hintText: "Дата рождения",
                        controller: _nameController,
                        width: double.infinity),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                        backgroundColor: Colors.white,
                        labelText: "Телефон",
                        hintText: "Телефон",
                        controller: _nameController,
                        width: double.infinity),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
