import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izobility_mobile/utils/utils.dart';
import 'package:izobility_mobile/widgets/button/app_bar_back_button.dart';
import 'package:izobility_mobile/widgets/button/custom_button.dart';
import 'package:izobility_mobile/widgets/text_field/custom_text_field.dart';

class EnterNameScreen extends StatelessWidget {
  EnterNameScreen({super.key});

  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: const AppBarBackButton(),
            leadingWidth: 36,
            toolbarHeight: 36,
          ),
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
              CustomTextField(
                hintText: 'Ваше имя',
                controller: nameController,
                width: double.infinity,
                labelText: "Как вас зовут",
              ),
              const SizedBox(
                height: 16,
              ),
              CustomButton(
                  text: 'Продолжить',
                  onTap: () {
                    Navigator.of(context).pushNamed("/create_password");
                  },
                  width: double.infinity)
            ],
          ),
        ),
      ),
    );
  }
}
