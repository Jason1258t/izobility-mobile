import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/feature/auth/data/auth_repository.dart';
import 'package:izobility_mobile/utils/animations.dart';
import 'package:izobility_mobile/utils/dialogs.dart';
import 'package:izobility_mobile/utils/route_names.dart';
import 'package:izobility_mobile/utils/utils.dart';
import 'package:izobility_mobile/utils/validators.dart';
import 'package:izobility_mobile/widgets/button/custom_button.dart';
import 'package:izobility_mobile/widgets/text_field/custom_text_field.dart';

import '../bloc/auth/auth_cubit.dart';

class EnterEmailScreen extends StatefulWidget {
  EnterEmailScreen({super.key});

  @override
  State<EnterEmailScreen> createState() => _EnterEmailScreenState();
}

class _EnterEmailScreenState extends State<EnterEmailScreen> {
  final TextEditingController emailController = TextEditingController();

  bool buttonActive = false;

  String? fieldError;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () async {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
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
                Column(
                  children: [
                    CustomTextField(
                      labelText: "Ваша почта",
                      keyboardType: TextInputType.emailAddress,
                      errorText: fieldError,
                      error: fieldError != null,
                      controller: emailController,
                      width: double.infinity,
                      onChange: (v) {
                        fieldError = Validator.emailValidator(v);
                        if (fieldError == null) {
                          buttonActive = true;
                          log((v ?? "").isNotEmpty.toString());
                        } else {
                          buttonActive = false;
                        }
                        log(fieldError.toString());
                        setState(() {});
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomButton(
                        text: 'Далее',
                        onTap: () {
                          Dialogs.showModal(
                              context,
                              const Center(
                                child: AppAnimations.circularProgressIndicator,
                              ));

                          BlocProvider.of<AuthCubit>(context)
                              .checkEmail(emailController.text.trim())
                              .then((accountState) {
                            if (accountState == EmailStateEnum.unregistered) {
                              context.push(RouteNames.authCreateName);
                            } else {
                              context.push(RouteNames.authEnterPassword);
                            }

                            Dialogs.hide(context);
                          });
                        },
                        isActive: buttonActive,
                        width: double.infinity),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}