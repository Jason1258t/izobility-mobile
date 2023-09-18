import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/utils/ui/fonts.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:izobility_mobile/widgets/button/custom_button.dart';
import 'package:izobility_mobile/widgets/scaffold/home_scaffold.dart';
import 'package:izobility_mobile/widgets/text_field/custom_text_field.dart';

class CardsAddScreen extends StatefulWidget {
  const CardsAddScreen({super.key});

  @override
  State<CardsAddScreen> createState() => _CardsAddScreenState();
}

class _CardsAddScreenState extends State<CardsAddScreen> {
  final _cardNumbeerController = TextEditingController();
  final _cvvController = TextEditingController();

  final _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: HomeScaffold(
        backgroundColor: AppColors.purpleBcg,
        appBar: CustomAppBar(
          backgroundColor: Colors.transparent,
          context: context,
          isBack: true,
          onTap: () {
            context.pop();
          },
          text: "Привязать новую кару",
        ),
        body: Container(
          padding: const EdgeInsets.all(16).copyWith(bottom: 0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            CustomTextField(
              backgroundColor: Colors.white,
              hintText: "Номер карты",
              controller: _cardNumbeerController,
              width: double.infinity,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextField(
                  backgroundColor: Colors.white,
                  hintText: "Срок действия",
                  controller: _cvvController,
                  width: size.width * 0.4333,
                  keyboardType: TextInputType.number,
                ),
                CustomTextField(
                  backgroundColor: Colors.white,
                  hintText: "CVV / CVC",
                  controller: _dateController,
                  width: size.width * 0.4333,
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            CustomButton(
                text: "Продолжить", onTap: () {}, width: double.infinity),
            const SizedBox(
              height: 32,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.purple400,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Включите NFC\nи приложите карту",
                      style: AppFonts.font24w700,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Мы автоматически соберём данные и внесём их",
                      style: AppFonts.font12w400,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Material(
                      borderRadius: BorderRadius.circular(100),
                      color: const Color(0xff1F1F1F),
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          width: size.width * 0.4444,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 28.5, vertical: 4),
                          child: Text(
                            "Включить NFC",
                            style: AppFonts.font14w700,
                          ),
                        ),
                      ),
                    )
                  ]),
            )
          ]),
        ),
      ),
    );
  }
}