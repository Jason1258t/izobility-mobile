import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/feature/profile/bloc/profile/profile_cubit.dart';
import 'package:izobility_mobile/feature/profile/data/user_repository.dart';
import 'package:izobility_mobile/utils/ui/fonts.dart';

class ProfileGenderChooseCard extends StatelessWidget {
  final String text;
  final int genderIndex;

  const ProfileGenderChooseCard({
    super.key,
    required this.text,
    required this.genderIndex,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<ProfileCubit>().changeUserGender(genderIndex);
        context.pop();
      },
      child: Row(
        children: [
          Checkbox.adaptive(
            value: context.read<UserRepository>().user.details?.gender ==
                genderIndex,
            onChanged: (_) {
              context.read<ProfileCubit>().changeUserGender(genderIndex);
              context.pop();
            },
          ),
          const SizedBox(
            width: 0,
          ),
          Text(
            text,
            style: AppTypography.font16w400.copyWith(color: Colors.black),
          )
        ],
      ),
    );
  }
}
