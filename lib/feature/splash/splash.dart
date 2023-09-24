import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/feature/auth/bloc/app/app_cubit.dart';
import 'package:izobility_mobile/feature/auth/data/auth_repository.dart';
import 'package:izobility_mobile/routes/route_names.dart';
import 'package:izobility_mobile/utils/ui/animations.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();

    nextLoad();
  }

  void nextLoad() async{
    await Future.delayed(const Duration(seconds: 5));

    await BlocProvider.of<AppCubit>(context).checkTokenExistence();

    GoRouter.of(context).go(RouteNames.root);
  }

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
            ],
          ),
        ));
  }
}
