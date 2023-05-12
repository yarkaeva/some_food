import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:some_food/core/domain/entity/order.dart';
import 'package:some_food/core/domain/repositories/order_repository.dart';

part 'orders_event.dart';
part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrderState> {
  OrdersBloc(repository)
      : _repository = repository,
        super(OrderInitial()) {
    on<OrderAdded>(_onOrderAdded);
    on<OrderDeleted>(_onOrderDeleted);
    on<OrderSatusUpdated>(_onOrderUpdated);
  }
  final OrderRepository _repository;

  Future<void> _onOrderAdded(OrderAdded event, Emitter<OrderState> emit) async {
    try {
      await _repository.placeOrder(event.order);
      await _ordersListUpdated(emit);
    } catch (_) {
      emit(LoadError());
    }
  }

  Future<void> _onOrderDeleted(
      OrderDeleted event, Emitter<OrderState> emit) async {
    try {
      emit(OrdersLoading());
      await _repository.deleteOrder(event.id);
      await _ordersListUpdated(emit);
    } catch (_) {
      emit(LoadError());
    }
  }

  Future<void> _onOrderUpdated(
      OrderSatusUpdated event, Emitter<OrderState> emit) async {
    try {
      emit(OrdersLoading());
      //TODO: implement updating an order status.
      await _ordersListUpdated(emit);
    } catch (_) {
      emit(LoadError());
    }
  }

  Future<void> _ordersListUpdated(Emitter<OrderState> emit) async {
    final orders = await _repository.getOrders();
    emit(OrdersLoaded(orders));
  }
}
