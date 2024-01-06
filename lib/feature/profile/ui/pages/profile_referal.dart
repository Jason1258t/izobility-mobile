import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/feature/profile/bloc/profile_referals/profile_referals_cubit.dart';
import 'package:izobility_mobile/feature/profile/data/user_repository.dart';
import 'package:izobility_mobile/feature/profile/ui/widgets/referral/invite_banner.dart';
import 'package:izobility_mobile/feature/profile/ui/widgets/referral/referral_card.dart';
import 'package:izobility_mobile/feature/profile/ui/widgets/referral/referral_counter.dart';
import 'package:izobility_mobile/localization/app_localizations.dart';
import 'package:izobility_mobile/utils/ui/fonts.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:izobility_mobile/widgets/scaffold/home_scaffold.dart';

class ProfileReferralScreen extends StatefulWidget {
  const ProfileReferralScreen({super.key});

  @override
  State<ProfileReferralScreen> createState() => ProfileReferralScreenState();
}

class ProfileReferralScreenState extends State<ProfileReferralScreen> {
  @override
  void initState() {
    context.read<ProfileReferralsCubit>().loadReferalList();

    super.initState();
  }

  String getReferralsSum() {
    final referrals =
        RepositoryProvider.of<UserRepository>(context).referralsList;

    if (referrals.isEmpty) return '0';

    return List.generate(referrals.length, (index) => (referrals[index].sum))
        .reduce((a, b) => a + b)
        .toString();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final localize = AppLocalizations.of(context)!;
    final userRepository = RepositoryProvider.of<UserRepository>(context);

    return HomeScaffold(
      appBar: CustomAppBar(
        context: context,
        text: localize.referrals,
        isBack: true,
        onTap: () {
          context.pop();
        },
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await context.read<ProfileReferralsCubit>().loadReferalList();
        },
        child: Container(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ReferralCounterWidget(),
                const SizedBox(
                  height: 16,
                ),
               const InvitesBanner(),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        localize.my_referals,
                        textAlign: TextAlign.start,
                        style: AppTypography.font20w700
                            .copyWith(color: Colors.black),
                      ),
                      BlocBuilder<ProfileReferralsCubit, ProfileReferralsState>(
                        builder: (context, state) {
                          if (state is ProfileReferalsLoading) {
                            return const Center(
                              child: CircularProgressIndicator.adaptive(),
                            );
                          } else if (state is ProfileReferalsSuccess ||
                              state is ProfileReferalsInitial) {
                            if (userRepository.referralsList.isEmpty) {
                              return Text(localize.you_have_no_referrals);
                            } else {
                              return Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Column(
                                  children: buildReferralListWidget(),
                                ),
                              );
                            }
                          }

                          return Container();
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> buildReferralListWidget() {
    final userRepository = context.read<UserRepository>();
    List<Widget> referralWidgetList = [];
    int lastIndex = userRepository.referralsList.length > 25
        ? 25
        : userRepository.referralsList.length;

    for (int i = 0; i < lastIndex; i++) {
      referralWidgetList
          .add(ReferralCard(referral: userRepository.referralsList[i]));
    }

    if (userRepository.referralsList.length > 50) {
      referralWidgetList.add(Text(
        "И еще ${userRepository.referralsList.length - 50}...",
        style: AppTypography.font14w700.copyWith(color: Colors.black),
      ));
    }

    return referralWidgetList;
  }
}
