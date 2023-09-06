import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izobility_mobile/utils/utils.dart';
import 'package:izobility_mobile/widgets/button/custom_button.dart';
import 'package:izobility_mobile/widgets/button/text_button_without_background.dart';
import 'package:izobility_mobile/widgets/keyboards/pin_keyboard.dart';
import 'package:izobility_mobile/widgets/text_fild/custom_text_fild.dart';

class PinScreen extends StatelessWidget {
  PinScreen({super.key});

  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 100, 16, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(width: double.infinity),
              SvgPicture.asset(
                'assets/icons/logo.svg',
                width: 180,
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                'Ваш код доступа',
                style: AppFonts.font14w700
                    .copyWith(color: AppColors.textSecondary),
              ),
              const SizedBox(height: 12,),
              const PinKeyboard(),
              const SizedBox(height: 40,),
              TextButtonWithoutBackground(onTap: () {}, text: 'Поддержка')
            ],
          ),
        ),
      ),
    );
  }
}
