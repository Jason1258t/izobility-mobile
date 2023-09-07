import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izobility_mobile/utils/constants.dart';
import 'package:izobility_mobile/utils/route_names.dart';
import 'package:izobility_mobile/utils/utils.dart';
import 'package:izobility_mobile/utils/validators.dart';
import 'package:izobility_mobile/widgets/button/custom_button.dart';
import 'package:izobility_mobile/widgets/text_field/custom_text_field.dart';

class EnterEmailScreen extends StatelessWidget {
  EnterEmailScreen({super.key});

  final TextEditingController emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
                      controller: emailController,
                      width: double.infinity,
                      validator: (v) => Validator.emailValidator(v),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomButton(
                        text: 'Войти',
                        onTap: () {
                          // TODO start process of check on existing an email

                          var fieldValue =
                              Validator.emailValidator(emailController.text);
                          if (emailController.text != "" &&
                              fieldValue == null) {
                            Navigator.of(context)
                                .pushNamed(RouteNames.authCreateName);
                          }
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
