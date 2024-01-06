import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:izobility_mobile/feature/profile/bloc/profile_referals/profile_referals_cubit.dart';
import 'package:izobility_mobile/feature/profile/data/user_repository.dart';
import 'package:izobility_mobile/localization/app_localizations.dart';
import 'package:izobility_mobile/utils/utils.dart';

class ReferralCounterWidget extends StatelessWidget {
  ReferralCounterWidget({super.key});

  final Widget loadingIndicator = Container(
    height: 18,
    width: 30,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: AppGradients.accentGreen),
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final localize = AppLocalizations.of(context)!;
    final userRepository = RepositoryProvider.of<UserRepository>(context);

    return BlocBuilder<ProfileReferralsCubit, ProfileReferralsState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          height: 75,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: AppColors.purpleBcg,
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: (size.width - 73) * 0.49,
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        getIncome(state, userRepository),
                        Text(
                          localize.income,
                          style: AppTypography.font12w400
                              .copyWith(color: AppColors.grey500),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: 1,
                color: AppColors.grey500,
                height: double.infinity,
              ),
              Container(
                alignment: Alignment.centerRight,
                width: (size.width - 73) * 0.5,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    getCount(state, userRepository),
                    Text(
                      localize.joined,
                      style: AppTypography.font12w400
                          .copyWith(color: AppColors.grey500),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  String getReferralsSum(UserRepository userRepository) {
    final referrals = userRepository.referralsList;

    if (referrals.isEmpty) return '0';

    return List.generate(referrals.length, (index) => (referrals[index].sum))
        .reduce((a, b) => a + b)
        .toString();
  }

  Widget getIncome(ProfileReferralsState state, UserRepository userRepository) {
    if (state is ProfileReferalsLoading) {
      return loadingIndicator;
    } else if (state is ProfileReferalsSuccess) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            getReferralsSum(userRepository),
            style: AppTypography.font18w700.copyWith(color: Colors.black),
          ),
          const SizedBox(
            width: 4,
          ),
          Image.asset(
            "assets/images/logo_coint_emrld.png",
            width: 20,
            fit: BoxFit.fitWidth,
          )
        ],
      );
    }

    return Container(
      height: 10,
    );
  }

  Widget getCount(ProfileReferralsState state, UserRepository userRepository) {
    if (state is ProfileReferalsLoading) {
      return loadingIndicator;
    } else if (state is ProfileReferalsSuccess) {
      return Text(
        userRepository.referralsList.length.toString(),
        style: AppTypography.font18w700.copyWith(color: Colors.black),
      );
    }

    return Container(
      height: 18,
    );
  }
}
