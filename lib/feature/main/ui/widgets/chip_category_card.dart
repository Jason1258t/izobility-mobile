import 'package:flutter/material.dart';
import 'package:izobility_mobile/utils/utils.dart';

class ChipCategoryCard extends StatefulWidget {
  final String text;
  final bool isActive;
  const ChipCategoryCard(
      {super.key, required this.text, required this.isActive});

  @override
  State<ChipCategoryCard> createState() => _ChipCategoryCardState();
}

class _ChipCategoryCardState extends State<ChipCategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: widget.isActive ? AppColors.primary : Colors.white),
      child: Text(widget.text, style: AppFonts.font12w700.copyWith(
        color: widget.isActive ? Colors.white : AppColors.blackGraySecondary
      ),),
    );
  }
}
