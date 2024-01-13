import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:izobility_mobile/feature/auth/bloc/app/app_cubit.dart';
import 'package:izobility_mobile/feature/profile/data/user_repository.dart';
import 'package:izobility_mobile/feature/wallet/data/wallet_repository.dart';
import 'package:izobility_mobile/localization/app_localizations.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/utils/ui/fonts.dart';
import 'package:izobility_mobile/utils/ui/gradients.dart';
import 'package:izobility_mobile/widgets/button/custom_button.dart';
import 'package:flutter/services.dart';

class GamesScreen extends StatefulWidget {
  const GamesScreen({super.key});

  @override
  State<GamesScreen> createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {
  void loadUnity() async {
    const String channel = 'unity_activity';
    const platform = MethodChannel(channel);

    final Future<Map<String, dynamic>> userBalances =
        RepositoryProvider.of<WalletRepository>(context).getUnityBalances();
    final Future<Map<String, dynamic>> userData =
        RepositoryProvider.of<UserRepository>(context).getUserJson();

    Future.wait([userData, userBalances]).then((value) async {
      final json = {}
        ..addAll(value[0])
        ..addAll(value[1]);
      try {
        BlocProvider.of<AppCubit>(context).runUnity();
        log('trying to start');
        final data = await platform.invokeMethod('startUnity', {'user': jsonEncode(json)});
        log(data.toString());
      } catch (e) {
        log(e.toString());
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    final localize = AppLocalizations.of(context)!;

    return Container(
      color: AppColors.purpleBcg,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(
                decelerationRate: ScrollDecelerationRate.fast),
            slivers: [
              SliverAppBar(
                backgroundColor: AppColors.purpleBcg,
                surfaceTintColor: Colors.transparent,
                pinned: true,
                floating: false,
                centerTitle: true,
                title: Text(
                  localize.gaming,
                  style: AppTypography.font16w700.copyWith(color: Colors.black),
                ),
              ),

              SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverToBoxAdapter(
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: AppGradients.gradientBlackGrey),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 300,
                            child: Stack(
                              children: [
                                Positioned.fill(
                                    child: Image.asset(
                                  "assets/images/activity_man.jpg",
                                  fit: BoxFit.cover,
                                )),
                                Positioned.fill(
                                    child: Container(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                        Colors.black.withOpacity(0.4),
                                        Colors.transparent
                                      ])),
                                )),
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16)
                                        .copyWith(bottom: 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          localize.activity,
                                          style: AppTypography.font18w700
                                              .copyWith(color: Colors.white),
                                        ),
                                        Text(
                                          localize.er_qr_games,
                                          style: AppTypography.font12w400
                                              .copyWith(color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  localize.what_is_inside,
                                  style: AppTypography.font20w700
                                      .copyWith(color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/icons/qrscaner.svg",
                                      color: Colors.white,
                                      width: 24,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      localize.qr_scanner,
                                      style: AppTypography.font14w400
                                          .copyWith(color: Colors.white),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/icons/aritem.svg",
                                      color: Colors.white,
                                      width: 24,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      localize.ar_scanner,
                                      style: AppTypography.font14w400
                                          .copyWith(color: Colors.white),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/icons/armap.svg",
                                      color: Colors.white,
                                      width: 24,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      localize.ar_card,
                                      style: AppTypography.font14w400
                                          .copyWith(color: Colors.white),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                CustomButton(
                                    gradient: AppGradients.gradientGreenWhite,
                                    textColor: Colors.black,
                                    fontSize: 18,
                                    text: localize.use,
                                    onTap: loadUnity,
                                    width: double.infinity)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
