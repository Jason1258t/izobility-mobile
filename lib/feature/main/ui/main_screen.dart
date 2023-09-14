import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/utils/utils.dart';
import 'package:izobility_mobile/widgets/scaffold/home_scaffold.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
        appBar: AppBar(
          backgroundColor: AppColors.backgroundContent,
          actions: [
            IconButton(
                onPressed: () {
                  context.push(RouteNames.notifications);
                },
                icon: const Icon(Icons.sports_baseball_outlined))
          ],
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              IconButton(
                icon: const Icon(Icons.wallet),
                onPressed: () {
                  context.push(RouteNames.wallet);
                },
              ),
            ]),
          ),
        ));
  }
}
