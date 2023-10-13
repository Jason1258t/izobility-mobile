import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:izobility_mobile/feature/profile/bloc/profile/profile_cubit.dart';
import 'package:izobility_mobile/feature/profile/data/user_repository.dart';
import 'package:izobility_mobile/models/user.dart';
import 'package:izobility_mobile/utils/utils.dart';

class ProfileCard extends StatefulWidget {
  const ProfileCard({
    super.key,
  });

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Material(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(100000),
            child: InkWell(
              borderRadius: BorderRadius.circular(100000),
              onTap: () {},
              child: Container(
                width: 64,
                height: 64,
                alignment: Alignment.center,
                child: const Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.white,
                  size: 23,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is ProfileWaiting) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              } else if (state is ProfileSuccessState) {
                final user = context.read<UserRepository>().user;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.details?.name == null || user.details?.name == ""
                          ? "Ваше имя"
                          : user.details!.name!,
                      style: AppTypography.font18w700
                          .copyWith(color: AppColors.textPrimary, height: 1),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      user.email ?? "email",
                      style: AppTypography.font12w400
                          .copyWith(color: AppColors.textPrimary, height: 1),
                    ),
                  ],
                );
              }

              return Container();
            },
          ),
        ]);
  }
}
