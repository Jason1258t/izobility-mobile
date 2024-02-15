import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:izobility_mobile/feature/auth/bloc/app/app_cubit.dart';
import 'package:izobility_mobile/localization/app_localizations.dart';
import 'package:izobility_mobile/utils/utils.dart';
import 'package:izobility_mobile/widgets/button/text_button_without_background.dart';
import 'package:izobility_mobile/widgets/keyboards/pin_keyboard.dart';
import 'package:izobility_mobile/widgets/scaffold/auth_scaffold.dart';

class EnterPinScreen extends StatefulWidget {
  const EnterPinScreen({super.key});

  @override
  State<EnterPinScreen> createState() => _EnterPinScreenState();
}

class _EnterPinScreenState extends State<EnterPinScreen> {
  @override
  void initState() {
    BlocProvider.of<AppCubit>(context).authWithBiometric();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final localize = AppLocalizations.of(context);

    String message = localize!.your_access_code;
    String retryMessage = localize.try_wrong_code_again;

    void checkPin(List<int> intPin) {
      BlocProvider.of<AppCubit>(context).checkPin(intPin.join()).then((value) {
        if (!value) {
          setState(() {
            message = retryMessage;
          });
        }
      });
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: AuthScaffold(
        topPadding: 0,
        isAppBar: false,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(width: double.infinity, height: 32),
            SvgPicture.asset(
              'assets/icons/top page navigation.svg',
              width: 160,
              fit: BoxFit.fitWidth,
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              message,
              style: AppTypography.font14w700
                  .copyWith(color: AppColors.textSecondary),
            ),
            const SizedBox(
              height: 12,
            ),
            PinKeyboard(
              commitDuration: const Duration(milliseconds: 300),
              commitCallback: checkPin,
            ),
            const SizedBox(
              height: 40,
            ),
            TextButtonWithoutBackground(onTap: () {}, text: localize.support)
          ],
        ),
      ),
    );
  }
}
