import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:izobility_mobile/feature/main/ui/widgets/banners/banner.dart';
import 'package:izobility_mobile/localization/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class KeineExchangeBanner extends StatelessWidget {
  const KeineExchangeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return BannerWidget(
        onTap: () {},
        asset: 'assets/images/Frame 1000007799.png',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    launchUrl(Uri.parse('http://keine-exchange.com'));
                  },
                  borderRadius: BorderRadius.circular(100),
                  child: Ink(
                    height: 28,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
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
                        SvgPicture.asset('assets/icons/world.svg'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    launchUrl(Uri.parse('https://t.me/kenenews'));
                  },
                  borderRadius: BorderRadius.circular(100),
                  child: Ink(
                    height: 28,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
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
                        SvgPicture.asset('assets/icons/tg.svg'),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
