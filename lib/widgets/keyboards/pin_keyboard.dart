import 'package:flutter/material.dart';
import 'package:izobility_mobile/utils/colors.dart';
import 'package:izobility_mobile/widgets/button/pin_keyboard_button.dart';

class PinKeyboard extends StatefulWidget {
  const PinKeyboard({super.key});

  @override
  State<PinKeyboard> createState() => _PinKeyboardState();
}

class _PinKeyboardState extends State<PinKeyboard> {
  List<int> pin = [];

  void _addNumber(int number) {
    pin.add(number);
    if (pin.length >= 4) pin.clear();
  }

  void _deleteNumber() {
    if (pin.isNotEmpty) pin.removeAt(pin.length - 1);
  }

  Widget _buildPinIndicators() {
    List<Widget> children = [];

    for (int i = 0; i < pin.length; i++) {
      children.add(Container(
        width: 21,
        height: 21,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(21),
          ),
        ),
      ));
    }
    for (int i = 0; i < 4 - pin.length; i++) {
      children.add(Container(
        width: 21,
        height: 21,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: AppColors.backgroundSecondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(21),
          ),
        ),
      ));
    }

    return SizedBox(
      width: 160,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: children,
      ),
    );
  }

  Widget _generateNumbers() {
    List<Widget> children = [];

    for (int i = 0; i < 3; i++) {
      List<Widget> line = [];
      for (int j = 1; j < 4; j++) {
        line.add(KeyboardButton(
          onTap: () {
            _addNumber(3 * i + j);
            setState(() {});
          },
          number: '${3 * i + j}',
        ));
      }
      children.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: line,
      ));
    }
    children.add(Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(
          width: 66,
        ),
        KeyboardButton(
          onTap: () {
            _addNumber(0);
            setState(() {});
          },
          number: '0',
        ),
        KeyboardButton(onTap: () {
          _deleteNumber();
          setState(() {});
        }),
      ],
    ));

    return SizedBox(
      width: 66 * 3 + 24,
      height: 66 * 4 + 36,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: children,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        _buildPinIndicators(),
        const SizedBox(
          height: 32,
        ),
        _generateNumbers()
      ],
    );
  }
}
