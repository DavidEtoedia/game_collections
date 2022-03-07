import 'package:bloc/bloc.dart';

// part 'appstate_state.dart';
// part 'appstate_cubit.freezed.dart';

class AppstateCubit extends Cubit<bool> {
  AppstateCubit() : super(false);
  // void increment() => emit(state);

  void toggleButton() {
    state == false ? emit(true) : emit(false);
    print(state);
  }
}
