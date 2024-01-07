import 'package:flutter/material.dart';
import 'package:izobility_mobile/utils/ui/animations.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: MediaQuery.sizeOf(context).width * 2 / 3,
                fit: BoxFit.fitWidth,
              ),
              const SizedBox(
                height: 30,
              ),
              const Center(child: AppAnimations.circularProgressIndicator)
            ],
          ),
        ));
  }
}
