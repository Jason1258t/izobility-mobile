import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/widgets/button/pin_keyboard_button.dart';

import '../../feature/auth/bloc/app/app_cubit.dart';

class PinKeyboard extends StatefulWidget {
  const PinKeyboard(
      {super.key,
      required this.commitCallback,
      required this.commitDuration,
      this.isFinger = true});

  final Function(List<int>) commitCallback;
  final Duration commitDuration;
  final bool isFinger;

  @override
  State<PinKeyboard> createState() => _PinKeyboardState();
}

class _PinKeyboardState extends State<PinKeyboard> {
  List<int> pin = [];
  Future<void> _addNumber(int number) async {
    if (pin.length < 4) pin.add(number);

    if (pin.length > 3) {
      setState(() {});
      await Future.delayed(widget.commitDuration);
      widget.commitCallback(pin);

      pin.clear();
    }
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

  Widget _generateNumbers(double size) {
    List<Widget> children = [];

    for (int i = 0; i < 3; i++) {
      List<Widget> line = [];
      for (int j = 1; j < 4; j++) {
        line.add(KeyboardButton(
          onTap: () async {
            await _addNumber(3 * i + j);
            setState(() {});
          },
          number: '${3 * i + j}',
          side: size,
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
        widget.isFinger
            ? InkWell(
                onTap: () {
                  BlocProvider.of<AppCubit>(context).authWithBiometric();
                },
                child: Ink(
                  width: size,
                  height: size,
                  padding: EdgeInsets.all(size * 12 / 70),
                  child: SvgPicture.asset(
                    color: Colors.grey[500],
                    'assets/icons/fingerprint.svg',
                  ),
                ),
              )
            : SizedBox(
                width: size,
                height: size,
              ),
        KeyboardButton(
          onTap: () async {
            await _addNumber(0);
            setState(() {});
          },
          number: '0',
          side: size,
        ),
        KeyboardButton(
          onTap: () {
            _deleteNumber();
            setState(() {});
          },
          keyboardButtonType: KeyboardButtonType.delete,
          side: size,
        ),
      ],
    ));

    return SizedBox(
      width: size * 3 + size / 5 * 2,
      height:  size * 4 + size / 5 * 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: children,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final double buttonSize = size.width * 0.19 < 70 ? size.width * 0.19 : 70;

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        _buildPinIndicators(),
        const SizedBox(
          height: 32,
        ),
        _generateNumbers(buttonSize)
      ],
    );
  }
}
