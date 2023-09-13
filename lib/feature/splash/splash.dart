import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:izobility_mobile/utils/animations.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                'assets/icons/Logotype.svg',
                width: MediaQuery.sizeOf(context).width - 40,
              ),
              const SizedBox(
                height: 30,
              ),
              const Center(child: AppAnimations.circularProgressIndicator)
              //const CustomLinearIndicator(),
            ],
          ),
        ));
  }
}
