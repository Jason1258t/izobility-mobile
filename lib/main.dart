import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:izobility_mobile/feature/auth/create_password.dart';
import 'package:izobility_mobile/feature/auth/enter_name.dart';
import 'package:izobility_mobile/feature/auth/pin_screen.dart';
import 'package:izobility_mobile/feature/auth/pin_screen_enter.dart';
import 'package:izobility_mobile/feature/home/ui/home_screen.dart';
import 'package:izobility_mobile/feature/splash/splash.dart';
import 'package:izobility_mobile/services/remote/api/api_service.dart';
import 'package:izobility_mobile/utils/utils.dart';

import 'feature/auth/enter_email.dart';
import 'services/locale/export_locale_services.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  Bloc.observer = CustomBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        RouteNames.root : (context) => const SplashScreen() ,
        RouteNames.home : (context) => const HomeScreen(),
        RouteNames.authCreateName : (context) => EnterNameScreen(),
        RouteNames.auth : (context) => EnterEmailScreen(),
        RouteNames.authEnterPin: (context) => const PinScreenEnter(),
        RouteNames.authCreatePassword: (context) => CreatePasswrordScreen(),
        RouteNames.authCreatePin: (context) => const PinScreen()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}