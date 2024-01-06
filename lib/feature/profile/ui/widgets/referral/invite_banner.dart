import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:izobility_mobile/feature/profile/data/user_repository.dart';
import 'package:izobility_mobile/localization/app_localizations.dart';
import 'package:izobility_mobile/utils/utils.dart';
import 'package:izobility_mobile/widgets/button/custom_button.dart';
import 'package:izobility_mobile/widgets/button_sheet/bottom_sheets.dart';
import 'package:izobility_mobile/widgets/popup/popup_qr.dart';
import 'package:izobility_mobile/widgets/snack_bar/custom_snack_bar.dart';
import 'package:share_plus/share_plus.dart';

class InvitesBanner extends StatelessWidget {
  const InvitesBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final localize = AppLocalizations.of(context)!;
    final userRepository = RepositoryProvider.of<UserRepository>(context);

    void copyReferralCode() async {
      Clipboard.setData(
          ClipboardData(text: userRepository.user.details!.referalCode!));
      ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar.snackBarCopied);
    }

    return Container(
      height: 140,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: AppGradients.shrek,
      ),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                width: (size.width - 85) * 0.55,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FittedBox(
                      child: Text(
                        localize.get_money_for_invite,
                        style: AppTypography.font20w700
                            .copyWith(color: Colors.white, letterSpacing: 0),
                      ),
                    ),
                    CustomButton(
                        gradient: AppGradients.accentGreen,
                        textColor: Colors.black,
                        fontSize: 14,
                        height: 28,
                        text: localize.share,
                        onTap: () async {
                          await Share.share(
                              userRepository.user.details!.referalCode!);
                        },
                        width: double.infinity),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 16),
                width: (size.width - 85) * 0.4654545454,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/sky_money.png",
                      fit: BoxFit.fitHeight,
                      height: 96,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: copyReferralCode,
                            child: Ink(
                              width: 28,
                              height: 28,
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: SvgPicture.asset(
                                  width: 24,
                                  height: 24,
                                  color: Colors.black,
                                  'assets/icons/copy.svg'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () async {
                              AppBottomSheets.setReferalCode(context);
                            },
                            child: Ink(
                              width: 28,
                              height: 28,
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: SvgPicture.asset(
                                  width: 24,
                                  height: 24,
                                  color: Colors.black,
                                  'assets/icons/write.svg'),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          Positioned(
              top: 16,
              right: 0,
              child: Material(
                borderRadius: BorderRadius.circular(6),
                color: Colors.white,
                child: InkWell(
                  borderRadius: BorderRadius.circular(6),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => const PopupQr());
                  },
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    child: SvgPicture.asset(
                      "assets/icons/qr.svg",
                      width: 24,
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
