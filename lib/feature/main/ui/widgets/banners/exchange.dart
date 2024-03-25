import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/feature/main/ui/widgets/banners/banner.dart';
import 'package:izobility_mobile/localization/app_localizations.dart';
import 'package:izobility_mobile/widgets/popup/custom_popup.dart';
import 'package:url_launcher/url_launcher.dart';

class ExchangeBanner extends StatelessWidget {
  const ExchangeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final localize = AppLocalizations.of(context)!;
    return BannerWidget(
        onTap: () {
          launchUrl(Uri.parse('https://altcoinshub.com/en/'));
        },
        asset: 'assets/images/banners/exchange-banner.png',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 104,
              height: 28,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: ShapeDecoration(
                color: const Color(0xFFFFD700),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    localize.exchange_banner_button,
                    style: const TextStyle(
                      color: Color(0xFF0E131F),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 0.10,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  const Icon(
                    Icons.arrow_forward,
                    size: 16,
                    weight: 1500,
                  )
                ],
              ),
            )
          ],
        ));
  }
}
