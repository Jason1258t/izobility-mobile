import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/utils/utils.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:izobility_mobile/widgets/button/custom_button.dart';
import 'package:izobility_mobile/widgets/scaffold/home_scaffold.dart';
import 'package:izobility_mobile/widgets/text_field/big_text_field.dart';

class EnterSeedPhraseScreen extends StatefulWidget {
  const EnterSeedPhraseScreen({super.key});

  @override
  State<EnterSeedPhraseScreen> createState() => _EnterSeedPhraseScreenState();
}

class _EnterSeedPhraseScreenState extends State<EnterSeedPhraseScreen> {
  final seedPhraseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: AppColors.purpleBcg,
        appBar: CustomAppBar(
          context: context,
          text: 'Ввод seed-phrase',
          onTap: () {
            context.pop();
          },
          isBack: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              OutLineTextField(
                onTapSuffixIcon: () {
                  Clipboard.getData(Clipboard.kTextPlain).then((value) {
                    setState(() {
                      seedPhraseController.text = value!.text!;
                    });
                  });
                },
                icon: 'assets/icons/clipboard.svg',
                controller: seedPhraseController,
                width: double.infinity,
                height: 200,
                maxLines: 7,
                hintText: 'Введите Seed-фразу',
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                  text: 'Войти',
                  onTap: () {
                    context.push(RouteNames.walletViewSeed);
                  },
                  width: double.infinity)
            ],
          ),
        ),
      ),
    );
  }
}
