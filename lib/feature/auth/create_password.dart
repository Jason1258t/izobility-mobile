import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izobility_mobile/utils/route_names.dart';
import 'package:izobility_mobile/utils/utils.dart';
import 'package:izobility_mobile/utils/validators.dart';
import 'package:izobility_mobile/widgets/button/app_bar_back_button.dart';
import 'package:izobility_mobile/widgets/button/custom_button.dart';
import 'package:izobility_mobile/widgets/scaffold/auth_scaffold.dart';
import 'package:izobility_mobile/widgets/text_field/custom_text_field.dart';

class CreatePasswrordScreen extends StatelessWidget {
  CreatePasswrordScreen({super.key});

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordRepeatedController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 32,
          ),
          SvgPicture.asset(
            'assets/icons/logo.svg',
            width: 180,
          ),
          const SizedBox(
            height: 32,
          ),
          CustomTextField(
            hintText: '*********',
            controller: passwordController,
            width: double.infinity,
            labelText: "Придумайте пароль для аккаунта",
            isObscured: true,
            validator: (v) => Validator.validatePassword(v),
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            hintText: '*********',
            controller: passwordRepeatedController,
            width: double.infinity,
            labelText: "Подтверждение пароля",
            isObscured: true,
            validator: (value) {
              if (value == "") {
                return null;
              }

              if (passwordRepeatedController.text != passwordController.text) {
                return "Парооли не совпадают!";
              }

              return null;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          CustomButton(
              text: 'Далее',
              onTap: () {
                String repeatedPassword = passwordRepeatedController.text;
                String password = passwordController.text;

                if (repeatedPassword == password &&
                    Validator.validatePassword(password) == null &&
                    password != "") {
                  Navigator.pushNamed(context, RouteNames.authCreatePin);
                }
              },
              width: double.infinity)
        ],
      ),
    );
  }
}
