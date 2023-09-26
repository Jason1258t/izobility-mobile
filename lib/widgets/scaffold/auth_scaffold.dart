import 'package:flutter/material.dart';
import 'package:izobility_mobile/widgets/button/app_bar_back_button.dart';

class AuthScaffold extends StatefulWidget {
  final Widget body;
  final bool isAppBar;

  const AuthScaffold({super.key, required this.body, this.isAppBar = true});

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
      child: GestureDetector(
        onTap: () async => FocusScope.of(context).unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            leading: widget.isAppBar ? const AppBarBackButton() : null,
            leadingWidth: 36,
            toolbarHeight: 36,
          ),
          body: widget.body,
        ),
      ),
    ));
  }
}
