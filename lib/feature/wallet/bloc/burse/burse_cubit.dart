import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'burse_state.dart';

class BurseCubit extends Cubit<BurseState> {
  BurseCubit() : super(BurseInitial());
}
