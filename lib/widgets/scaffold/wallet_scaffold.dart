import 'package:flutter/material.dart';

class WalletScaffold extends StatefulWidget {
  final Widget body;
  final Function onTap;
  final AppBar? appBar;
  final Color scaffoldColor;
  final Color backgroundColor;

  const WalletScaffold(
      {super.key,
        required this.body,
      required this.onTap, this.appBar,
      required this.backgroundColor,
      required this.scaffoldColor});

  @override
  State<WalletScaffold> createState() => WalletScaffoldState();
}

class WalletScaffoldState extends State<WalletScaffold> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap,
      child: Container(
        color: widget.backgroundColor,
        child: SafeArea(
          child: Scaffold(
            appBar: widget.appBar,
            resizeToAvoidBottomInset: false,
            backgroundColor: widget.scaffoldColor,
            body: widget.body,
          ),
        ),
      ),
    );
  }
}
