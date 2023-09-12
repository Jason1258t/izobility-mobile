import 'package:flutter/material.dart';
import 'package:izobility_mobile/widgets/button/app_bar_back_button.dart';

class AuthScaffold extends StatefulWidget {
  final Widget body;

  const AuthScaffold({super.key, required this.body});

  @override
  State<AuthScaffold> createState() => AuthScaffoldState();
}

class AuthScaffoldState extends State<AuthScaffold> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: const AppBarBackButton(),
          leadingWidth: 36,
          toolbarHeight: 36,
        ),
        body: widget.body,
      ),
    ));
  }
}
