import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izobility_mobile/feature/auth/bloc/auth/auth_cubit.dart';
import 'package:izobility_mobile/utils/animations.dart';
import 'package:izobility_mobile/utils/dialogs.dart';
import 'package:izobility_mobile/utils/validators.dart';
import 'package:izobility_mobile/widgets/button/custom_button.dart';
import 'package:izobility_mobile/widgets/scaffold/auth_scaffold.dart';
import 'package:izobility_mobile/widgets/text_field/custom_text_field.dart';

class CreatePasswordScreen extends StatefulWidget {
  const CreatePasswordScreen({super.key});

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController passwordRepeatedController =
      TextEditingController();

  bool hidePassword = true;
  String? fieldsError;

  bool buttonActive = false;

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
              errorText: fieldsError,
              error: fieldsError != null,
              obscured: hidePassword,
              controller: passwordController,
              width: double.infinity,
              labelText: "Придуайте пароль",
              suffixIconCallback: () {
                setState(() {
                  hidePassword = !hidePassword;
                });
              },
              onChange: (value) {
                String repeatedPassword =
                    passwordRepeatedController.text.trim();
                String password = passwordController.text.trim();

                buttonActive = (repeatedPassword == password &&
                    Validator.validatePassword(password) == null);

                if (passwordRepeatedController.text.isNotEmpty) {
                  fieldsError = Validator.validatePassword(password);
                  if (fieldsError == null && repeatedPassword != password) {
                    fieldsError = 'Пароли не совпадают';
                  }
                }

                setState(() {});
              }),
          const SizedBox(
            height: 16,
          ),
          CustomTextField.password(
            errorText: fieldsError,
            error: fieldsError != null,
            obscured: hidePassword,
            controller: passwordRepeatedController,
            width: double.infinity,
            labelText: "Повторите пароль",
            suffixIconCallback: () {
              setState(() {
                hidePassword = !hidePassword;
              });
            },
            onChange: (value) {
              String repeatedPassword = passwordRepeatedController.text.trim();
              String password = passwordController.text.trim();

              buttonActive = (repeatedPassword == password &&
                  Validator.validatePassword(password) == null);

              fieldsError = Validator.validatePassword(password);
              if (fieldsError == null && repeatedPassword != password) {
                fieldsError = 'Пароли не совпадают';
              }
              setState(() {});
            },
          ),
          const SizedBox(
            height: 16,
          ),
          BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthProcessState) {
                Dialogs.showModal(
                    context,
                    const Center(
                      child: AppAnimations.circularProgressIndicator,
                    ));
              } else {
                Dialogs.hide(context);
              }
            },
            child: CustomButton(
                isActive: buttonActive,
                text: 'Далее',
                onTap: () {
                  String repeatedPassword =
                      passwordRepeatedController.text.trim();
                  String password = passwordController.text.trim();

                  buttonActive = (repeatedPassword == password &&
                      Validator.validatePassword(password) == null);

                  fieldsError = Validator.validatePassword(password);
                  if (fieldsError == null && repeatedPassword != password) {
                    fieldsError = 'Пароли не совпадают';
                  }

                  if (fieldsError == null) {
                    BlocProvider.of<AuthCubit>(context).registerData!.password =
                        password;
                    BlocProvider.of<AuthCubit>(context).register();
                  } else {
                    setState(() {});
                  }
                },
                width: double.infinity),
          )
        ],
      ),
    );
  }
}
