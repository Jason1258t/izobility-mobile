import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izobility_mobile/utils/utils.dart';
import 'package:izobility_mobile/widgets/button/app_bar_back_button.dart';
import 'package:izobility_mobile/widgets/button/text_button_without_background.dart';
import 'package:izobility_mobile/widgets/keyboards/pin_keyboard.dart';
import 'package:izobility_mobile/widgets/scaffold/auth_scaffold.dart';

class PinScreen extends StatelessWidget {

  const PinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(width: double.infinity, height: 32),
            SvgPicture.asset(
              'assets/icons/logo.svg',
              width: 180,
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              'Ваш код доступа',
              style: AppFonts.font14w700.copyWith(color: AppColors.textSecondary),
            ),
            const SizedBox(
              height: 12,
            ),
            const PinKeyboard(),
            const SizedBox(
              height: 40,
            ),
            TextButtonWithoutBackground(onTap: () {}, text: 'Поддержка')
          ],
        ),
      );
  }
}
