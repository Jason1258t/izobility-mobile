import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_app_bar.dart';

class ProfileLanguageScreen extends StatefulWidget {
  const ProfileLanguageScreen({super.key});

  @override
  State<ProfileLanguageScreen> createState() => _ProfileLanguageScreenState();
}

class _ProfileLanguageScreenState extends State<ProfileLanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(
            context: context,
            text: "Смена языка",
            isBack: true,
            onTap: () {
              context.pop();
            },
          ),
          body: Column(
            children: [ ],
          ),
        ),
      ),
    );
  }
}
