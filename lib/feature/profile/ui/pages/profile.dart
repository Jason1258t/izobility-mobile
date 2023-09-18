import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/feature/profile/ui/widgets/profile_action_square.dart';
import 'package:izobility_mobile/feature/profile/ui/widgets/profile_actione_tile.dart';
import 'package:izobility_mobile/feature/profile/ui/widgets/profile_bloc_label.dart';
import 'package:izobility_mobile/feature/profile/ui/widgets/profile_card.dart';
import 'package:izobility_mobile/feature/profile/ui/widgets/profile_switch_card.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/routes/route_names.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:izobility_mobile/widgets/button/custom_outline_button.dart';
import 'package:izobility_mobile/widgets/scaffold/home_scaffold.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      appBar: CustomAppBar(
        context: context,
        text: "Профиль",
        isBack: false,
        onTap: () {
          context.pop();
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(16).copyWith(bottom: 0),
              color: AppColors.backgroundSecondary,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                      padding: const EdgeInsets.all(12).copyWith(right: 19),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const ProfileCard(),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/edit.svg',
                                  color: AppColors.lightGreyIcon,
                                  width: 24,
                                  height: 24,
                                ),
                                Positioned.fill(
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () {
                                        context.push(RouteNames.profileEdit);
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 16,
                  ),
                  const CustomOutlineButton(),
                  const SizedBox(
                    height: 16,
                  ),
                  Wrap(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.spaceBetween,
                    runAlignment: WrapAlignment.start,
                    runSpacing: 10,
                    children: [
                      ProfileActionContainer(
                        onTap: () {
                          context.push(RouteNames.cards);
                        },
                      ),
                      ProfileActionContainer(
                        onTap: () {
                          context.push(RouteNames.cardsAdd);
                        },
                      ),
                      ProfileActionContainer(
                        onTap: () {},
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const ProfileSwitchCard(
                  iconPath: 'assets/icons/music.svg',
                  label: "Бизнес аккаунт",
                  description: "Какое то описание",
                ),
                const PorfileBlocLabel(
                  text: 'Приложение',
                ),
                ProfileActionTile(
                  onTap: () {
                    context.push(RouteNames.profileSettings);
                  },
                  label: 'Настройки',
                  iconPath: 'assets/icons/settings.svg',
                ),
                ProfileActionTile(
                  onTap: () {
                    context.push(RouteNames.profileAbout);
                  },
                  label: 'О приложении',
                  iconPath: 'assets/icons/warning_raunded.svg',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
