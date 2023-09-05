import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:izobility_mobile/widgets/progress_indicators/linear_progress_indicator.dart';
import 'package:izobility_mobile/widgets/scaffold/splash_loading_scaffold.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3))
        .then((value) => Navigator.pushNamed(context, '/pin_screen'));

    return SplashScaffold(
        body: Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 110),
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/icons/logo.svg',
            width: 270,
          ),
          const SizedBox(
            height: 30,
          ),
          const Center(
            child: CircularProgressIndicator(),
          )
          //const CustomLinearIndicator(),
        ],
      ),
    ));
  }
}
