import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/feature/profile/data/user_repository.dart';
import 'package:izobility_mobile/feature/profile/ui/widgets/profile_aspect.dart';
import 'package:izobility_mobile/feature/profile/ui/widgets/profile_card.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/utils/ui/fonts.dart';
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

  String? genderType;

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
                              description:
                                  "Иначе вы потеряете введенные вами изменения",
                              onAccept: () async {
                                final user = await context
                                    .read<UserRepository>()
                                    .preferences
                                    .getUser();

                                final token = await context
                                    .read<UserRepository>()
                                    .preferences
                                    .getToken();
                                print(user!.id);
                                print(token!.accessToken);
                              },
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
                    Material(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 36, vertical: 16),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(16)),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        ProfileGenderChooseCard(
                                          text: "Мужской",
                                          isActive: false,
                                        ),
                                        ProfileGenderChooseCard(
                                          text: "Женский",
                                          isActive: false,
                                        ),
                                        ProfileGenderChooseCard(
                                          text: "Другой",
                                          isActive: false,
                                        )
                                      ]),
                                );
                              });
                        },
                        child: Container(
                          height: 56,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.transparent,
                              border: Border.all(
                                  width: 1, color: AppColors.disableButton)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                genderType ?? "Пол",
                                style: AppFonts.font16w400
                                    .copyWith(color: AppColors.hintText),
                              ),
                              Icon(
                                Icons.arrow_drop_down_outlined,
                                size: 35,
                                color: Colors.black,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
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

class ProfileGenderChooseCard extends StatelessWidget {
  final bool isActive;
  final String text;

  const ProfileGenderChooseCard({
    super.key,
    required this.isActive,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox.adaptive(
          value: isActive,
          onChanged: (_) {},
        ),
        const SizedBox(
          width: 0,
        ),
        Text(
          text,
          style: AppFonts.font16w400.copyWith(color: Colors.black),
        )
      ],
    );
  }
}
