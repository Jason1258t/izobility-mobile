import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izobility_mobile/utils/constants.dart';
import 'package:izobility_mobile/utils/utils.dart';
import 'package:izobility_mobile/widgets/button/custom_button.dart';
import 'package:izobility_mobile/widgets/text_field/custom_text_field.dart';

class EnterEmailScreen extends StatelessWidget {
  EnterEmailScreen({super.key});

  final TextEditingController nameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  emailValidator(value) {
    if (!RegExp(emailRegExp).hasMatch(value!.trim())) {
      return 'Не верный email';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 100, 16, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                'assets/icons/logo.svg',
                width: 180,
              ),
              const SizedBox(
                height: 32,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      labelText: "Ваша почта",
                      hintText: 'Тут ваша почта',
                      controller: nameController,
                      width: double.infinity,
                      validator: (value) {
                        if (!RegExp(emailRegExp).hasMatch(value!.trim())) {
                          return 'Не верный email';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomButton(
                        text: 'Продолжить',
                        onTap: () {
                          Navigator.of(context).pushNamed("/enter_name");
                        },
                        width: double.infinity),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
