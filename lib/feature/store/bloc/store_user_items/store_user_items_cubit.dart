import 'package:bloc/bloc.dart';
import 'package:izobility_mobile/feature/store/data/store_repository.dart';
import 'package:meta/meta.dart';

part 'store_user_items_state.dart';

class StoreUserItemsCubit extends Cubit<StoreUserItemsState> {
  final StoreRepository storeRepository;

  StoreUserItemsCubit(this.storeRepository) : super(StoreUserItemsInitial());

  Future<void> loadUserItems() async {
    emit(StoreUserItemsLoading());

    try {
      await storeRepository.getUserProductList();
      emit(StoreUserItemsSuccess());
    } catch (ex, stacktrace) {
      print(ex);
      print(stacktrace);
      emit(StoreUserItemsFailure());
    }
  }
}
