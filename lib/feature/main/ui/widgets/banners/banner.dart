import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget(
      {super.key,
      required this.child,
      required this.onTap,
      required this.asset});

  final Widget child;
  final VoidCallback onTap;
  final String asset;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Ink(
          width: width - 32,
          height: width * 124 / 328,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image:
                  DecorationImage(image: AssetImage(asset), fit: BoxFit.fill)),
          child: child),
    );
  }
}
