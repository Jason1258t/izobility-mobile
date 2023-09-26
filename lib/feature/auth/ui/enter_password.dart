import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izobility_mobile/feature/auth/bloc/auth/auth_cubit.dart';
import 'package:izobility_mobile/feature/auth/bloc/password_recovery/password_recovery_cubit.dart';
import 'package:izobility_mobile/utils/utils.dart';
import 'package:izobility_mobile/utils/logic/validators.dart';
import 'package:izobility_mobile/widgets/button/custom_button.dart';
import 'package:izobility_mobile/widgets/button/text_button_without_background.dart';
import 'package:izobility_mobile/widgets/scaffold/auth_scaffold.dart';
import 'package:izobility_mobile/widgets/text_field/custom_text_field.dart';

import '../../../utils/ui/animations.dart';
import '../../../utils/ui/dialogs.dart';

class EnterPasswordScreen extends StatefulWidget {
  const EnterPasswordScreen({super.key});

  @override
  State<EnterPasswordScreen> createState() => _EnterPasswordScreenState();
}

class _EnterPasswordScreenState extends State<EnterPasswordScreen> {
  final TextEditingController passwordController = TextEditingController();

  bool hidePassword = true;
  bool buttonActive = false;
  bool showBanner = true;
  String? filedError;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => FocusScope.of(context).unfocus(),
      child: AuthScaffold(
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
              errorText: filedError,
              error: filedError != null,
              obscured: hidePassword,
              controller: passwordController,
              width: double.infinity,
              labelText: "Код подтверждения",
              suffixIconCallback: () {
                setState(() {
                  hidePassword = !hidePassword;
                });
              },
              onChange: (value) {
                filedError = Validator.validatePassword((value ?? '').trim());
                buttonActive = filedError == null;
                showBanner = false;
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
                  text: 'Войти',
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    BlocProvider.of<AuthCubit>(context).loginData!.password =
                        passwordController.text.trim();
                    BlocProvider.of<AuthCubit>(context).login();
                  },
                  width: double.infinity),
            ),
            const SizedBox(
              height: 14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BlocBuilder<PasswordRecoveryCubit, PasswordRecoveryState>(
                    builder: (context, state) {
                  if (state is PasswordRecoveryWait) {
                    return Text(
                      'Отправить ещё раз (${state.remainingTime} сек)',
                      style: AppFonts.font12w400
                          .copyWith(color: AppColors.disabledTextButton),
                    );
                  } else {
                    return TextButtonWithoutBackground(
                      onTap: () {
                        BlocProvider.of<PasswordRecoveryCubit>(context)
                            .sendRecoveryEmail(
                                BlocProvider.of<AuthCubit>(context)
                                    .getUserId()!);
                      },
                      text: 'Отправить ещё раз',
                      textColor: Colors.black,
                      textStyle: AppFonts.font12w400,
                    );
                  }
                }),
              ],
            ),
            if (showBanner) ...[
              const SizedBox(
                height: 16,
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9)),
                    color: AppColors.primary),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Проверить почту',
                      style: AppFonts.font24w700,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Мы отправили письмо для восстановления вашего аккаунта',
                      style: AppFonts.font12w400,
                    )
                  ],
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}
