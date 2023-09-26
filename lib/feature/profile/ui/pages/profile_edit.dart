import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/feature/profile/bloc/cubit/profile_cubit.dart';
import 'package:izobility_mobile/feature/profile/data/user_repository.dart';
import 'package:izobility_mobile/utils/logic/constants.dart';
import 'package:izobility_mobile/utils/logic/mask_text_field.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/utils/ui/fonts.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:izobility_mobile/widgets/popup/popup_logout.dart';
import 'package:izobility_mobile/widgets/text_field/custom_text_field.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    loadData();
    super.initState();
  }

  Future<void> loadData() async {
    await context.read<ProfileCubit>().loadUserDetailsInfo();

    final userRepository = context.read<UserRepository>();

    _nameController.text = userRepository.user.details?.name ?? "";
    _surnameController.text = userRepository.user.details?.fam ?? "";
    _emailController.text = userRepository.user.email ?? "";
    _phoneController.text = userRepository.user.details?.phone ?? "";
    _birthdayController.text = userRepository.user.details?.birthday ?? "";
  }

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _birthdayController.dispose();
    super.dispose();
  }

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
                                context.read<ProfileCubit>().updateUserData(
                                      birthday: _birthdayController.text,
                                      gender: context
                                          .read<UserRepository>()
                                          .user
                                          .details!
                                          .gender!,
                                      name: _nameController.text,
                                      surname: _surnameController.text,
                                    );

                                context.pop();
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
            body: BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                if (state is ProfileWaiting || state is ProfileInitial) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (state is ProfileSuccessState) {
                  return buildUserDetialsInfo();
                } else {
                  return const Center(
                    child: Text('Sorry something wetn wrong'),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget buildUserDetialsInfo() {
    final user = context.read<UserRepository>().user;

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16).copyWith(bottom: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextField(
                backgroundColor: Colors.white,
                labelText: "Имя",
                hintText: user.details?.name ?? "Имя",
                controller: _nameController,
                width: double.infinity),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
                backgroundColor: Colors.white,
                labelText: "Фамилия",
                hintText: "Фамилия",
                controller: _surnameController,
                width: double.infinity),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
                backgroundColor: Colors.white,
                labelText: "Почта",
                hintText: "Почта",
                controller: _emailController,
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
                          child: const Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ProfileGenderChooseCard(
                                  genderIndex: 0,
                                  text: "Мужской",
                                ),
                                ProfileGenderChooseCard(
                                  genderIndex: 1,
                                  text: "Женский",
                                ),
                                ProfileGenderChooseCard(
                                  genderIndex: 2,
                                  text: "Другой",
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
                      border:
                          Border.all(width: 1, color: AppColors.disableButton)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppStrings.gender[user.details?.gender] == null
                          ? Text(
                              "Пол",
                              style: AppTypography.font16w400
                                  .copyWith(color: AppColors.hintText),
                            )
                          : Text(
                              AppStrings.gender[user.details?.gender]!,
                              style: AppTypography.font16w400
                                  .copyWith(color: Colors.black),
                            ),
                      const Icon(
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
                keyboardType: TextInputType.number,
                hintText: "2005-12-31",
                controller: _birthdayController,
                mask: AppMask.maskDatetimeFormatter,
                width: double.infinity),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
                backgroundColor: Colors.white,
                labelText: "Телефон",
                hintText: "Телефон",
                controller: _phoneController,
                width: double.infinity),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileGenderChooseCard extends StatelessWidget {
  final String text;
  final int genderIndex;

  const ProfileGenderChooseCard({
    super.key,
    required this.text,
    required this.genderIndex,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<ProfileCubit>().changeUserGender(genderIndex);
        context.pop();
      },
      child: Row(
        children: [
          Checkbox.adaptive(
            value: context.read<UserRepository>().user.details?.gender ==
                genderIndex,
            onChanged: (_) {},
          ),
          const SizedBox(
            width: 0,
          ),
          Text(
            text,
            style: AppTypography.font16w400.copyWith(color: Colors.black),
          )
        ],
      ),
    );
  }
}
