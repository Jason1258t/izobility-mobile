import 'package:flutter/material.dart';
import 'package:izobility_mobile/utils/colors.dart';
import 'package:izobility_mobile/utils/fonts.dart';

class CustomLinearIndicator extends StatefulWidget {
  const CustomLinearIndicator({super.key});

  @override
  State<CustomLinearIndicator> createState() => _CustomLinearIndicatorState();
}

class _CustomLinearIndicatorState extends State<CustomLinearIndicator>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LinearProgressIndicator(
          value: controller.value,
          semanticsLabel: 'Linear progress indicator',
          backgroundColor: AppColors.backgroundSecondary,
          color: AppColors.primary,
          minHeight: 8,
          borderRadius: BorderRadius.circular(4),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          '${(controller.value * 100).round()}% загрузка',
          style: AppFonts.h3.copyWith(color: AppColors.primary),
        )
      ],
    );
  }
}
