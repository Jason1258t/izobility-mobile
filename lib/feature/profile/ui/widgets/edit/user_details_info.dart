import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/feature/profile/data/user_repository.dart';
import 'package:izobility_mobile/feature/profile/ui/widgets/edit/gender_choose_card.dart';
import 'package:izobility_mobile/localization/app_localizations.dart';
import 'package:izobility_mobile/utils/utils.dart';
import 'package:izobility_mobile/widgets/text_field/custom_text_field.dart';

class UserDetailInfo extends StatefulWidget {
  const UserDetailInfo(
      {super.key,
      required this.nameController,
      required this.surnameController,
      required this.emailController,
      required this.phoneController,
      required this.birthdayController,
      required this.birthdayToString,
      required this.countryController,
      required this.cityController});

  final TextEditingController nameController;
  final TextEditingController surnameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController birthdayController;
  final TextEditingController countryController;
  final TextEditingController cityController;
  final String Function(DateTime) birthdayToString;

  @override
  State<UserDetailInfo> createState() => _UserDetailInfoState();
}

class _UserDetailInfoState extends State<UserDetailInfo> {
  @override
  Widget build(BuildContext context) {
    final user = context.read<UserRepository>().user;
    final localize = AppLocalizations.of(context)!;

    Map<int, String> gender = {0: localize.man, 1: localize.woman};

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16).copyWith(bottom: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextField(
                backgroundColor: Colors.white,
                labelText: localize.name,
                hintText: user.details?.name ?? localize.name,
                controller: widget.nameController,
                width: double.infinity),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
                backgroundColor: Colors.white,
                labelText: localize.surname,
                hintText: localize.surname,
                controller: widget.surnameController,
                width: double.infinity),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
                backgroundColor: Colors.white,
                labelText: 'email',
                hintText: localize.mail,
                controller: widget.emailController,
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
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ProfileGenderChooseCard(
                                  genderIndex: 0,
                                  text: localize.man,
                                ),
                                ProfileGenderChooseCard(
                                  genderIndex: 1,
                                  text: localize.woman,
                                ),
                                ProfileGenderChooseCard(
                                  genderIndex: 2,
                                  text: localize.another,
                                )
                              ]),
                        );
                      });
                },
                child: Container(
                  height: 56,
                  padding: const EdgeInsets.only(right: 5, left: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.transparent,
                      border:
                          Border.all(width: 1, color: AppColors.disableButton)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      gender[user.details?.gender] == null
                          ? Text(
                              localize.sex,
                              style: AppTypography.font16w400
                                  .copyWith(color: AppColors.hintText),
                            )
                          : Text(
                              gender[user.details?.gender]!,
                              style: AppTypography.font16w400
                                  .copyWith(color: Colors.black),
                            ),
                      const Icon(
                        Icons.arrow_drop_down_outlined,
                        size: 20,
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
            CustomTextField.withOneIcon(
              readOnly: true,
              backgroundColor: Colors.white,
              labelText: localize.birthday,
              hintText: localize.birthday,
              controller: widget.birthdayController,
              width: double.infinity,
              obscured: false,
              suffixIconChild: const Icon(
                Icons.date_range_outlined,
                size: 20,
                color: Colors.black,
              ),
              suffixIconCallback: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(200),
                  lastDate: DateTime(2100),
                );
                if (date != null) {
                  widget.birthdayController.text =
                      widget.birthdayToString(date);
                }
              },
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextField.withOneIcon(
                suffixIconCallback: () {
                  context.push(RouteNames.profilePhone);
                },
                obscured: false,
                suffixIconChild: const Icon(
                  Icons.navigate_next_rounded,
                  size: 24,
                  color: Colors.black,
                ),
                readOnly: true,
                backgroundColor: Colors.white,
                labelText: localize.phone,
                hintText: localize.phone,
                controller: widget.phoneController,
                width: double.infinity),
            const SizedBox(
              height: 16,
            ),
            CSCPicker(
              onCountryChanged: (value) {
                widget.countryController.text = value;
                setState(() {});
              },
              onStateChanged: (value) {
                setState(() {});
              },
              onCityChanged: (value) {
                if (value != null) {
                  widget.cityController.text = value;
                }
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
