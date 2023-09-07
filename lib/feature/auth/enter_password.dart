import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izobility_mobile/utils/route_names.dart';
import 'package:izobility_mobile/utils/utils.dart';
import 'package:izobility_mobile/widgets/button/app_bar_back_button.dart';
import 'package:izobility_mobile/widgets/button/custom_button.dart';
import 'package:izobility_mobile/widgets/scaffold/auth_scaffold.dart';
import 'package:izobility_mobile/widgets/text_field/custom_text_field.dart';

class EnterNameScreen extends StatelessWidget {
  EnterNameScreen({super.key});

  final TextEditingController passwordController = TextEditingController();

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
            labelText: "Пароль от вашего аккаунта",
          ),
          const SizedBox(
            height: 16,
          ),
          CustomButton(
              text: 'Войти',
              onTap: () {
                Navigator.of(context).pushNamed(RouteNames.authEnterPin);
              },
              width: double.infinity)
        ],
      ),
    );
  }
}
