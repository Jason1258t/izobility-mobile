import 'package:bloc/bloc.dart';
import 'package:izobility_mobile/feature/profile/data/user_repository.dart';
import 'package:meta/meta.dart';

part 'profile_referals_state.dart';

class ProfileReferralsCubit extends Cubit<ProfileReferralsState> {
  final UserRepository userRepository;

  ProfileReferralsCubit(this.userRepository) : super(ProfileReferalsInitial());

  Future<void> loadReferalList() async {
    emit(ProfileReferalsLoading());

    try {
      await userRepository.loadReferralsList();
      emit(ProfileReferalsSuccess());
    } catch (ex) {
      print(ex);
      emit(ProfileReferalsFailure());
    }
  }
}
