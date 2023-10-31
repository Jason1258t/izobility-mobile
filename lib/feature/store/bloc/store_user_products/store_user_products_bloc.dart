import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'store_user_products_event.dart';
part 'store_user_products_state.dart';

class StoreUserProductsBloc extends Bloc<StoreUserProductsEvent, StoreUserProductsState> {
  StoreUserProductsBloc() : super(StoreUserProductsInitial()) {
    on<StoreUserProductsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
