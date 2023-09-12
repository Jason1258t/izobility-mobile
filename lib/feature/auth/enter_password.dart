import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izobility_mobile/utils/route_names.dart';
import 'package:izobility_mobile/utils/utils.dart';
import 'package:izobility_mobile/widgets/button/app_bar_back_button.dart';
import 'package:izobility_mobile/widgets/button/custom_button.dart';
import 'package:izobility_mobile/widgets/scaffold/auth_scaffold.dart';
import 'package:izobility_mobile/widgets/text_field/custom_text_field.dart';

class EnterPasswordScreen extends StatefulWidget {
  EnterPasswordScreen({super.key});

  @override
  State<EnterPasswordScreen> createState() => _EnterPasswordScreenState();
}

class _EnterPasswordScreenState extends State<EnterPasswordScreen> {
  final TextEditingController passwordController = TextEditingController();

  bool hidePassword = true;

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
          CustomTextField.password(
            obscured: hidePassword,
            //hintText: '*********',
            controller: passwordController,
            width: double.infinity,
            labelText: "Ваш пароль",
            suffixIconCallback: () {
              setState(() {
                hidePassword = !hidePassword;
              });
            },
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
