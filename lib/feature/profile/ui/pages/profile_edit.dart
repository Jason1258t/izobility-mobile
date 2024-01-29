import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/feature/profile/bloc/profile/profile_cubit.dart';
import 'package:izobility_mobile/feature/profile/data/user_repository.dart';
import 'package:izobility_mobile/feature/profile/ui/widgets/edit/user_details_info.dart';
import 'package:izobility_mobile/localization/app_localizations.dart';
import 'package:izobility_mobile/models/user_details.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:izobility_mobile/widgets/app_bar/custom_app_bar.dart';
import 'package:izobility_mobile/widgets/popup/popup_logout.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  @override
  void initState() {
    loadData();
    super.initState();
  }

  String birthdayToString(DateTime birthday) =>
      "${birthday.day}.${birthday.month}.${birthday.year}";

  String userPhone(UserDetailsModel details) =>
      "+${details.phoneCountry}${details.phone}";

  Future<void> loadData() async {
    final userRepository = context.read<UserRepository>();

    _nameController.text = userRepository.user.details?.name ?? "";
    _surnameController.text = userRepository.user.details?.fam ?? "";
    _emailController.text = userRepository.user.email ?? "";

    if (userRepository.user.details != null) {
      if (userRepository.user.details!.phone != null) {
        _phoneController.text = userPhone(userRepository.user.details!);
      }
      if (userRepository.user.details!.birthday != null) {
        _birthdayController.text =
            birthdayToString(userRepository.user.details!.birthday!);
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _birthdayController.dispose();
    super.dispose();
  }

  void saveChanges() {
    final userRepository = RepositoryProvider.of<UserRepository>(context);

    print(_countryController.text.split('    ')[1]);
    print(_cityController.text);

    if (_nameController.text == "" || _surnameController.text == "") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content:
              Text(AppLocalizations.of(context)!.you_cannot_change_of_empty)));
      context.pop();
      _nameController.text == userRepository.user.details!.name;
    } else {

      context.read<ProfileCubit>().updateUserData(
            birthday: _birthdayController.text,
            gender: userRepository.user.details!.gender!,
            name: _nameController.text,
            surname: _surnameController.text,
            city: _cityController.text,
            country: _countryController.text,
          );

      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final localize = AppLocalizations.of(context)!;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.purpleBcg,
            appBar: CustomAppBar(
              actions: [
                Material(
                  child: InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: ((context) => PopupChoose(
                              label: localize.save_chages,
                              description: localize.loose_data,
                              onAccept: saveChanges,
                              onDecline: () => context.pop())));
                    },
                    child: Container(
                        width: 45,
                        height: double.infinity,
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.check,
                          size: 25,
                          weight: 700,
                        )),
                  ),
                )
              ],
              context: context,
              text: localize.profile_code,
              isBack: true,
              onTap: () {
                context.pop();
              },
            ),
            body: BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                if (state is ProfileWaiting || state is ProfileInitial) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (state is ProfileSuccessState) {
                  return UserDetailInfo(
                    nameController: _nameController,
                    surnameController: _surnameController,
                    phoneController: _phoneController,
                    emailController: _emailController,
                    birthdayController: _birthdayController,
                    cityController: _cityController,
                    countryController: _countryController,
                    birthdayToString: birthdayToString,
                  );
                } else {
                  return Center(
                    child: Text(localize.error_on_server),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
