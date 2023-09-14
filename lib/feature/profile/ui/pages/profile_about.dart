import 'package:flutter/material.dart';
import 'package:izobility_mobile/feature/profile/ui/widgets/profile_actione_tile.dart';
import 'package:izobility_mobile/feature/profile/ui/widgets/profile_aspect.dart';
import 'package:izobility_mobile/feature/profile/ui/widgets/profile_bloc_label.dart';
import 'package:izobility_mobile/feature/profile/ui/widgets/profile_switch_card.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:izobility_mobile/widgets/button/custom_text_button.dart';

class ProfileAppAboutScreen extends StatefulWidget {
  const ProfileAppAboutScreen({super.key});

  @override
  State<ProfileAppAboutScreen> createState() => _ProfileAppAboutScreenState();
}

class _ProfileAppAboutScreenState extends State<ProfileAppAboutScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: CustomAppBar(context: context, text: 'О приложении'),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 200,
                  color: Colors.red,
                ),
                // TODO here might be app data but there are not ui for  it
                CustomTextButton(title: "Сайт компании", onTap: () {}),
                CustomTextButton(
                    title: "Пользовательское соглашение", onTap: () {}),
                CustomTextButton(
                    title: "Договор публичной офёрты", onTap: () {}),
                CustomTextButton(title: "Лицензии", onTap: () {}),
              ],
            ),
          )),
    );
  }
}
