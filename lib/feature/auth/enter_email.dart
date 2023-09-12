import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/feature/auth/bloc/auth/auth_cubit.dart';
import 'package:izobility_mobile/utils/constants.dart';
import 'package:izobility_mobile/utils/route_names.dart';
import 'package:izobility_mobile/utils/utils.dart';
import 'package:izobility_mobile/utils/validators.dart';
import 'package:izobility_mobile/widgets/button/custom_button.dart';
import 'package:izobility_mobile/widgets/text_field/custom_text_field.dart';

class EnterEmailScreen extends StatefulWidget {
  EnterEmailScreen({super.key});

  @override
  State<EnterEmailScreen> createState() => _EnterEmailScreenState();
}

class _EnterEmailScreenState extends State<EnterEmailScreen> {
  final TextEditingController emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool buttonActive = false;

  String? fieldError;

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
                      //hintText: 'Тут ваша почта',
                      errorText: fieldError,
                      error: fieldError != null,
                      controller: emailController,
                      width: double.infinity,
                      onChange: (v) {
                        fieldError = Validator.emailValidator(v);
                        if (fieldError == null) {
                          buttonActive = true;
                          log((v??"").isNotEmpty.toString());
                          log('хуй');
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
                          // TODO start process of check on existing an email
                            //BlocProvider.of<AuthCubit>(context).checkEmail(emailController.text.trim());
                            context.push(RouteNames.authCreateName);
                        },
                        isActive: buttonActive,
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
