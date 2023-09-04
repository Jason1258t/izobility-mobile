import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:izobility_mobile/widgets/progress_indicators/linear_progress_indicator.dart';
import 'package:izobility_mobile/widgets/scaffold/splash_loading_scaffold.dart';

class SplashWithProgressBar extends StatelessWidget {
  const SplashWithProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SplashScaffold(body: Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 66),
      child: Column(
        children: [
          SvgPicture.asset('assets/icons/logo.svg', width: 270,),
          const SizedBox(height: 30,),
          const CustomLinearIndicator()
        ],
      ),
    ));
  }
}
