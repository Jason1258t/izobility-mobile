import 'package:bloc/bloc.dart';
import 'package:izobility_mobile/feature/wallet/data/burse_repository.dart';
import 'package:izobility_mobile/utils/logic/enums.dart';
import 'package:meta/meta.dart';

part 'burse_general_orders_state.dart';

class BurseGeneralOrdersCubit extends Cubit<BurseGeneralOrdersState> {
  final BurseRepository burseRepository;

  BurseGeneralOrdersCubit(this.burseRepository)
      : super(BurseGeneralOrdersInitial()) {
    burseRepository.burseGeneralOrdersStream.listen((value) {
      if (value == LoadingStateEnum.loading) emit(BurseGeneralOrdersLoading());
      if (value == LoadingStateEnum.success) emit(BurseGeneralOrdersSuccess());
      if (value == LoadingStateEnum.fail) emit(BurseGeneralOrdersFailure());
    });
  }
}
