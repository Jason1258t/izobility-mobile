import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:izobility_mobile/feature/auth/create_password.dart';
import 'package:izobility_mobile/feature/auth/enter_name.dart';
import 'package:izobility_mobile/feature/auth/pin_screen.dart';
import 'package:izobility_mobile/feature/home/ui/home_screen.dart';
import 'package:izobility_mobile/feature/splash/splash.dart';
import 'package:izobility_mobile/utils/colors.dart';

import 'feature/auth/enter_email.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => const SplashScreen() ,
        '/home_screen' : (context) => const HomeScreen(),
        '/enter_name' : (context) => EnterNameScreen(),
        '/enter_email' : (context) => EnterEmailScreen(),
        '/pin_screen' : (context) => PinScreen(),
        '/create_password': (context) => CreatePasswrordScreen(),
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