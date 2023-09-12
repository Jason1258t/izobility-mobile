import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izobility_mobile/utils/route_names.dart';
import 'package:izobility_mobile/utils/utils.dart';
import 'package:izobility_mobile/utils/validators.dart';
import 'package:izobility_mobile/widgets/button/app_bar_back_button.dart';
import 'package:izobility_mobile/widgets/button/custom_button.dart';
import 'package:izobility_mobile/widgets/scaffold/auth_scaffold.dart';
import 'package:izobility_mobile/widgets/text_field/custom_text_field.dart';

class EnterNameScreen extends StatefulWidget {
  const EnterNameScreen({super.key});

  @override
  State<EnterNameScreen> createState() => _EnterNameScreenState();
}

class _EnterNameScreenState extends State<EnterNameScreen> {
  final TextEditingController nameController = TextEditingController();

  String? fieldError;
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
          CustomTextField(
            hintText: 'Ваше имя',
            controller: nameController,
            width: double.infinity,
            labelText: "Как вас зовут",
            error: fieldError != null,
            errorText: fieldError,
            onChange: (v) {
              setState(() {
                fieldError = Validator.nameValidator(v ?? '');
                buttonActive = fieldError == null;
              });
            },
          ),
          const SizedBox(
            height: 16,
          ),
          CustomButton(
              text: 'Далее',
              isActive: buttonActive,
              onTap: () {
                Navigator.of(context).pushNamed(RouteNames.authEnterPassword);
              },
              width: double.infinity)
        ],
      ),
    );
  }
}
