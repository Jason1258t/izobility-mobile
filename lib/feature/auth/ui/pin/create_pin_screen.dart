import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:izobility_mobile/feature/auth/bloc/app/app_cubit.dart';
import 'package:izobility_mobile/localization/app_localizations.dart';
import 'package:izobility_mobile/utils/utils.dart';
import 'package:izobility_mobile/widgets/button/text_button_without_background.dart';
import 'package:izobility_mobile/widgets/keyboards/pin_keyboard.dart';
import 'package:izobility_mobile/widgets/scaffold/auth_scaffold.dart';

class CreatePinScreen extends StatefulWidget {
  const CreatePinScreen({super.key});

  @override
  State<CreatePinScreen> createState() => _CreatePinScreenState();
}

class _CreatePinScreenState extends State<CreatePinScreen> {
  String firstPin = '';

  @override
  Widget build(BuildContext context) {
    final localize = AppLocalizations.of(context)!;

    final String createPin = localize.come_up_with_access_code;
    final String repeatPin = localize.repeat_access_code;
    final String doNotMatch = localize.pincodes_not_mutch;
    String message = createPin;

    void setPin(List<int> pin) async {
      log(firstPin.toString());
      if (firstPin.isEmpty) {
        firstPin = pin.join();
        message = repeatPin;
        log(firstPin.toString());
        setState(() {});
      } else {
        if (firstPin != pin.join()) {
          setState(() {
            message = doNotMatch;
          });
          await Future.delayed(const Duration(milliseconds: 1200));
          message = createPin;
          firstPin = '';
          setState(() {});
        } else {
          BlocProvider.of<AppCubit>(context).createPin(firstPin);
        }
      }
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: AuthScaffold(
        isAppBar: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              'assets/icons/top page navigation.svg',
              width: 160,
              fit: BoxFit.fitWidth,
            ),
            const SizedBox(
              width: double.infinity,
              height: 10,
            ),
            Text(
              message,
              style: AppTypography.font14w700
                  .copyWith(color: AppColors.textSecondary),
            ),
            const SizedBox(
              height: 12,
            ),
            PinKeyboard(
              commitDuration: const Duration(milliseconds: 150),
              commitCallback: setPin,
              isFinger: false,
            ),
            const SizedBox(
              height: 25,
            ),
            TextButtonWithoutBackground(onTap: () {}, text: localize.support)
          ],
        ),
      ),
    );
  }
}
