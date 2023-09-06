import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izobility_mobile/utils/utils.dart';
import 'package:izobility_mobile/widgets/button/app_bar_back_button.dart';
import 'package:izobility_mobile/widgets/button/custom_button.dart';
import 'package:izobility_mobile/widgets/text_field/custom_text_field.dart';

class CreatePasswrordScreen extends StatelessWidget {
  CreatePasswrordScreen({super.key});

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordRepeatedController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: const AppBarBackButton(),
            leadingWidth: 36,
            toolbarHeight: 36,
          ),
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
                validator: (value) {
                  if (value == null) {
                    return null;
                  }

                  if (value.length < 6) {
                    return 'Слишком короткий';
                  }

                  return null;
                },
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
                  // if (value == null) {
                  //   return null;
                  // }

                  // if () {
                  //   return 'Пароли не совпадают';
                  // }
                  
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              CustomButton(
                  text: 'Продолжить',
                  onTap: () {
                    Navigator.pushNamed(context, '/pin_screen');
                  },
                  width: double.infinity)
            ],
          ),
        ),
      ),
    );
  }
}
