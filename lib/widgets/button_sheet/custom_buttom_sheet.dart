import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardButtonSheet extends StatefulWidget {
  const CardButtonSheet({super.key});

  @override
  State<CardButtonSheet> createState() => _CardButtonSheetState();
}

class _CardButtonSheetState extends State<CardButtonSheet> {
  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);

    return Container(
      height: 100,
      width: sizeOf.width,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: Row(
              children: [
                SvgPicture.asset('assets/icons/verified.svg')
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: Row(
              children: [],
            ),
          )
        ],
      ),
    );
  }
}
