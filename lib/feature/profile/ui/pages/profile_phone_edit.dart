import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/localization/app_localizations.dart';
import 'package:izobility_mobile/routes/go_routes.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:izobility_mobile/widgets/button/custom_button.dart';
import 'package:izobility_mobile/widgets/scaffold/home_scaffold.dart';
import 'package:izobility_mobile/widgets/text_field/custom_text_field.dart';

class ProfilePhoneConfirm extends StatefulWidget {
  const ProfilePhoneConfirm({super.key});

  @override
  State<ProfilePhoneConfirm> createState() => _ProfilePhoneConfirmState();
}

class _ProfilePhoneConfirmState extends State<ProfilePhoneConfirm> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final localize = AppLocalizations.of(context)!;
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        text: "Подтвержение номера",
        isBack: true,
        onTap: () {
          context.pop();
        },
      ),
      body: Container(
        padding: const EdgeInsets.all(16).copyWith(bottom: 16),
        child: Column(
          children: [
            CustomTextField(
                backgroundColor: Colors.white,
                hintText: localize.telephone,
                keyboardType: TextInputType.phone,
                controller: controller,
                width: size.width),
            const SizedBox(
              height: 16,
            ),
            CustomButton(
                text: localize.next,
                onTap: () => context.push(RouteNames.profilePhoneConfirm),
                width: size.width)
          ],
        ),
      ),
    );
  }
}
