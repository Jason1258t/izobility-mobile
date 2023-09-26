import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/feature/auth/bloc/app/app_cubit.dart';
import 'package:izobility_mobile/feature/auth/bloc/auth/auth_cubit.dart';
import 'package:izobility_mobile/feature/profile/bloc/cubit/profile_cubit.dart';
import 'package:izobility_mobile/feature/profile/data/user_repository.dart';
import 'package:izobility_mobile/feature/profile/ui/widgets/profile_action_square.dart';
import 'package:izobility_mobile/feature/profile/ui/widgets/profile_actione_tile.dart';
import 'package:izobility_mobile/feature/profile/ui/widgets/profile_bloc_label.dart';
import 'package:izobility_mobile/feature/profile/ui/widgets/profile_card.dart';
import 'package:izobility_mobile/feature/profile/ui/widgets/profile_switch_card.dart';
import 'package:izobility_mobile/routes/go_routes.dart';
import 'package:izobility_mobile/models/user.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:izobility_mobile/widgets/button/custom_outline_button.dart';
import 'package:izobility_mobile/widgets/popup/popup_logout.dart';
import 'package:izobility_mobile/widgets/scaffold/home_scaffold.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    context.read<ProfileCubit>().loadUserCachedData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        context: context,
        text: "Профиль",
        isBack: false,
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileWaiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16).copyWith(bottom: 0),
                    color: AppColors.purpleBcg,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ProfileCard(
                                ),
                              ],
                            )),
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
                                GoRouter.of(context).go(RouteNames.cards);
                              },
                            ),
                            ProfileActionContainer(
                              onTap: () {
                                GoRouter.of(context).go(RouteNames.cardsAdd);
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
                      const PorfileBlocLabel(
                        text: 'Аккаунт',
                      ),
                      ProfileActionTile(
                        onTap: () {
                          context.push(RouteNames.profileEdit);
                        },
                        label: 'Данные аккаунта',
                        iconPath: 'assets/icons/profile.svg',
                      ),
                      const PorfileBlocLabel(
                        text: 'Социальные сети Emerald',
                      ),
                      ProfileActionTile(
                        onTap: () {
                          context.push(RouteNames.profileSettings);
                        },
                        label: 'TikTok',
                        iconPath: 'assets/icons/tiktok.svg',
                      ),
                      ProfileActionTile(
                        onTap: () {},
                        label: 'Intagram',
                        iconPath: 'assets/icons/instagram.svg',
                      ),
                      ProfileActionTile(
                        onTap: () {},
                        label: 'Telegram',
                        iconPath: 'assets/icons/tg.svg',
                      ),
                      const PorfileBlocLabel(
                        text: 'Общие',
                      ),
                      ProfileActionTile(
                        onTap: () {
                          context.push(RouteNames.profileAbout);
                        },
                        label: 'О приложении',
                        iconPath: 'assets/icons/question.svg',
                      ),
                      ProfileActionTile(
                        onTap: () {},
                        label: 'Политика конфиденциальности',
                        iconPath: 'assets/icons/safe.svg',
                      ),
                      ProfileActionTile(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) => PopupChoose(
                                    label: "Вы точно хотите выйти?",
                                    onAccept: () {
                                      context.read<ProfileCubit>().logout();
                                      context.read<AuthCubit>().checkLogin();
                                    },
                                    onDecline: () {
                                      context.pop();
                                    },
                                  ));
                        },
                        label: 'Выйти',
                        iconPath: 'assets/icons/logout.svg',
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
