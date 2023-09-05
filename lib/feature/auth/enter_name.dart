import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izobility_mobile/utils/utils.dart';
import 'package:izobility_mobile/widgets/button/custom_button.dart';
import 'package:izobility_mobile/widgets/text_fild/custom_text_fild.dart';

class EnterNameScreen extends StatelessWidget {
  EnterNameScreen({super.key});

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
            children: [
              SvgPicture.asset(
                'assets/icons/logo.svg',
                width: 180,
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                children: [
                  Text(
                    'Как вас зовут',
                    style: AppFonts.font14w700
                        .copyWith(color: AppColors.textSecondary),
                  ),
                ],
              ),
              const SizedBox(height: 6,),
              CustomTextField(hintText: 'Ваше имя', controller: nameController, width: double.infinity),
              const SizedBox(height: 16,),
              CustomButton(text: 'Продолжить', onTap: () {}, width: double.infinity)
            ],
          ),
        ),
      ),
    );
  }
}
