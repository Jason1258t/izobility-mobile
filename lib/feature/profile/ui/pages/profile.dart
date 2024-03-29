import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/feature/auth/bloc/auth/auth_cubit.dart';
import 'package:izobility_mobile/feature/profile/bloc/profile/profile_cubit.dart';
import 'package:izobility_mobile/feature/profile/bloc/profile_links/profile_links_cubit.dart';
import 'package:izobility_mobile/feature/profile/data/user_repository.dart';
import 'package:izobility_mobile/feature/profile/ui/widgets/profile/profile_action_square.dart';
import 'package:izobility_mobile/feature/profile/ui/widgets/profile/profile_actione_tile.dart';
import 'package:izobility_mobile/feature/profile/ui/widgets/profile/user_products.dart';
import 'package:izobility_mobile/feature/profile/ui/widgets/profile_bloc_label.dart';
import 'package:izobility_mobile/feature/profile/ui/widgets/profile/profile_card.dart';
import 'package:izobility_mobile/feature/store/data/store_repository.dart';
import 'package:izobility_mobile/localization/app_localizations.dart';
import 'package:izobility_mobile/routes/go_routes.dart';
import 'package:izobility_mobile/services/remote/constants/api_constants.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/utils/ui/dialogs.dart';
import 'package:izobility_mobile/utils/ui/fonts.dart';
import 'package:izobility_mobile/utils/ui/gradients.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:izobility_mobile/widgets/popup/popup_logout.dart';
import 'package:izobility_mobile/widgets/snack_bar/custom_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

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
    final localize = AppLocalizations.of(context)!;
    final userRepository = RepositoryProvider.of<UserRepository>(context);
    final storeRepository = RepositoryProvider.of<StoreRepository>(context);
    return BlocListener<ProfileLinksCubit, ProfileLinksState>(
      listener: (context, state) {
        if (state is ProfileLinksFail) {
          context.pop();
          ScaffoldMessenger.of(context)
              .showSnackBar(CustomSnackBar.errorSnackBar(localize.try_later));
        } else if (state is ProfileLinksLoading) {
          Dialogs.show(
              context,
              const Center(
                child: CircularProgressIndicator(),
              ));
        } else {
          context.pop();
        }
      },
      child: Container(
        color: Colors.white,
        child: Scaffold(
            backgroundColor: AppColors.purpleBcg,
            appBar: CustomAppBar(
              context: context,
              text: localize.profile,
              isBack: false,
            ),
            body: RefreshIndicator(
              onRefresh: () async {
                userRepository.loadUserDetailsInfo();
                storeRepository.getUserProductList();
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16).copyWith(bottom: 0),
                      color: AppColors.purpleBcg,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          BlocBuilder<ProfileCubit, ProfileState>(
                            builder: (context, state) {
                              if (userRepository.user.details?.phone != null &&
                                  userRepository.user.details?.phone != "") {
                                return Container();
                              } else {
                                return Container(
                                  padding: const EdgeInsets.all(16),
                                  margin: const EdgeInsets.only(bottom: 16),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      gradient: AppGradients.gradientGreenDark,
                                      borderRadius: BorderRadius.circular(16)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        localize.confirm_phone,
                                        style: AppTypography.font18w700
                                            .copyWith(color: Colors.white),
                                        textAlign: TextAlign.left,
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        localize
                                            .without_phone_not_more_functions,
                                        style: AppTypography.font12w400
                                            .copyWith(color: Colors.white),
                                      )
                                    ],
                                  ),
                                );
                              }
                            },
                          ),
                          Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16)),
                              child: const Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                label: localize.abstract_programm,
                                description: "",
                                onTap: () {
                                  context.push(RouteNames.profileReferal);
                                },
                              ),
                              ProfileActionContainer(
                                label: localize.affiliate_program,
                                description: localize.standard_partner,
                                onTap: () {
                                  context.push(RouteNames.develop);
                                },
                              ),
                              ProfileActionContainer(
                                label: localize.inventory,
                                description: localize.objects,
                                onTap: () {
                                  context.push(RouteNames.develop);
                                },
                              ),
                              ProfileActionContainer(
                                label: localize.cards,
                                description: localize.my_bank_cards,
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
                    Container(
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 16, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  localize.my_pyrchases,
                                  style: AppTypography.font16w400
                                      .copyWith(color: AppColors.textPrimary),
                                ),
                                IconButton(
                                    onPressed: () {
                                      context
                                          .push(RouteNames.storeUserProducts);
                                    },
                                    icon: const Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      size: 16,
                                      color: Colors.black,
                                    ))
                              ],
                            ),
                          ),
                          const UserProductsWidget(),
                          ProfileBlocLabel(
                            text: localize.account,
                          ),
                          ProfileActionTile(
                            onTap: () {
                              context.push(RouteNames.profileEdit);
                            },
                            label: localize.account_data,
                            iconPath: 'assets/icons/profile.svg',
                          ),
                          ProfileActionTile(
                            onTap: () {
                              context.push(RouteNames.profileLanguage);
                            },
                            label: localize.apllication_languahe,
                            iconPath: 'assets/icons/world.svg',
                          ),
                          ProfileBlocLabel(
                            text: localize.social_net_em,
                          ),
                          ProfileActionTile(
                            onTap: () async {
                              context
                                  .read<ProfileLinksCubit>()
                                  .loadLink(urlTikTOk);

                              await launchUrl(Uri.parse(urlTikTOk));
                            },
                            label: 'TikTok',
                            iconPath: 'assets/icons/tiktok.svg',
                          ),
                          ProfileActionTile(
                            onTap: () {
                              context
                                  .read<ProfileLinksCubit>()
                                  .loadLink(urlTelegram);
                            },
                            label: 'Telegram',
                            iconPath: 'assets/icons/tg.svg',
                          ),
                          ProfileBlocLabel(
                            text: localize.general,
                          ),
                          ProfileActionTile(
                            onTap: () {
                              context.push(RouteNames.profileAbout);
                            },
                            label: localize.about_app,
                            iconPath: 'assets/icons/question.svg',
                          ),
                          ProfileActionTile(
                            onTap: () {
                              context.push(RouteNames.profilePrivacyPolicy);
                            },
                            label: localize.privacy_policy,
                            iconPath: 'assets/icons/safe.svg',
                          ),
                          ProfileActionTile(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => PopupChoose(
                                        label: localize.confirm_logout,
                                        onAccept: () {
                                          context.read<ProfileCubit>().logout();
                                          context
                                              .read<AuthCubit>()
                                              .checkLogin();
                                        },
                                        onDecline: () {
                                          context.pop();
                                        },
                                      ));
                            },
                            label: localize.logout,
                            iconPath: 'assets/icons/logout.svg',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
