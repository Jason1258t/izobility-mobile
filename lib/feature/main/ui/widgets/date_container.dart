import 'package:flutter/material.dart';
import 'package:izobility_mobile/utils/utils.dart';

class DateText extends StatefulWidget {
  final String date;

  const DateText({super.key, required this.date});

  @override
  State<DateText> createState() => _DateTextState();
}

class _DateTextState extends State<DateText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        widget.date,
        style: AppFonts.font12w400.copyWith(color: AppColors.blackGraySecondary),
        textAlign: TextAlign.center,
      ),
    );
  }
}
