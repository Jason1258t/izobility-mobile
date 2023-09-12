import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/utils/colors.dart';
import 'package:izobility_mobile/utils/route_names.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5))
        .then((value) => context.go(RouteNames.auth));

    FocusScope.of(context).unfocus();

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
              const Center(
                child: SizedBox(
                  width: 44,
                  height: 44,
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                    strokeWidth: 3,
                  ),
                ),
              )
              //const CustomLinearIndicator(),
            ],
          ),
        ));
  }
}
