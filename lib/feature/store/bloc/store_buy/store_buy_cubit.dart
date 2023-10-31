import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'store_buy_state.dart';

class StoreBuyCubit extends Cubit<StoreBuyState> {
  StoreBuyCubit() : super(StoreBuyInitial());
}
