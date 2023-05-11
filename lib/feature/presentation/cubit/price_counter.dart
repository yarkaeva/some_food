import 'package:bloc/bloc.dart';

class PriceCounterCubit extends Cubit<int> {
  PriceCounterCubit() : super(100);

  void increment() {
    if (state < 1000) return emit(state + 50);
  }

  void decrement() {
    if (state > 100) return emit(state - 50);
  }
}
