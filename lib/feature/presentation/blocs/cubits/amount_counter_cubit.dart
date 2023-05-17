import 'package:bloc/bloc.dart';

class AmountCounterCubit extends Cubit<int> {
  AmountCounterCubit() : super(1);

  void increment() {
    if (state < 10) return emit(state + 1);
  }

  void decrement() {
    if (state > 1) return emit(state - 1);
  }
}
