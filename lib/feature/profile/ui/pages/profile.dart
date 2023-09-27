import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/feature/auth/bloc/auth/auth_cubit.dart';
import 'package:izobility_mobile/feature/profile/bloc/cubit/profile_cubit.dart';
import 'package:izobility_mobile/feature/profile/data/user_repository.dart';
import 'package:izobility_mobile/feature/profile/ui/widgets/profile_action_square.dart';
import 'package:izobility_mobile/feature/profile/ui/widgets/profile_actione_tile.dart';
import 'package:izobility_mobile/feature/profile/ui/widgets/profile_bloc_label.dart';
import 'package:izobility_mobile/feature/profile/ui/widgets/profile_card.dart';
import 'package:izobility_mobile/routes/go_routes.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_app_bar.dart';
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
        body: SingleChildScrollView(
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
                        child: const Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ProfileCard(),
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
                          label: "Реферальная программа",
                          description: "Алмазный статус",
                          onTap: () {
                            context.push(RouteNames.develop);
                          },
                        ),
                        ProfileActionContainer(
                          label: "Партнёрская программа",
                          description: "Стандартный партнёр",
                          onTap: () {
                            context.push(RouteNames.develop);
                          },
                        ),
                        ProfileActionContainer(
                          label: "Инвентарь",
                          description: '2056 предметов',
                          onTap: () {
                            context.push(RouteNames.develop);
                          },
                        ),
                        ProfileActionContainer(
                          label: "Карты",
                          description: 'Мои банковские карты',
                          onTap: () {
                            context.push(RouteNames.cards);
                          },
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
        ));
  }
}
