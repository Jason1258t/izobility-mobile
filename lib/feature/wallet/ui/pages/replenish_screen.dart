import 'package:flutter/material.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:izobility_mobile/widgets/scaffold/home_scaffold.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ReplenishScreen extends StatefulWidget {
  const ReplenishScreen({super.key});

  @override
  State<ReplenishScreen> createState() => _ReplenishScreenState();
}

class _ReplenishScreenState extends State<ReplenishScreen> {
  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      appBar: CustomAppBar(
        context: context,
        text: 'Получить %Валюты%',
        isBack: true,
      ),
      body: Container(
        color: AppColors.purpleBcg,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(20),
                  child: QrImageView(
                    data: '1234567890',
                    version: QrVersions.auto,
                    size: 200.0,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
