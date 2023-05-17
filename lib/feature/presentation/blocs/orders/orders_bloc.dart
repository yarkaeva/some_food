import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:some_food/core/domain/entity/order.dart';
import 'package:some_food/core/domain/repositories/order_repository.dart';
import 'package:some_food/core/domain/repositories/user_repository.dart';

part 'orders_event.dart';
part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrderState> {
  OrdersBloc({
    required OrderRepository ordersRepo,
    required UserRepository userRepo,
  })  : _ordersRepository = ordersRepo,
        _userRepository = userRepo,
        super(OrderInitial()) {
    on<FirstLoad>(_onFirstLoad);
    on<OrderAdded>(_onOrderAdded);
    on<OrderDeleted>(_onOrderDeleted);
    on<OrderSatusUpdated>(_onOrderUpdated);
  }
  final OrderRepository _ordersRepository;
  final UserRepository _userRepository;

  Future<void> _onFirstLoad(
    FirstLoad event,
    Emitter<OrderState> emit,
  ) async {
    try {
      emit(OrdersLoading());
      await _ordersListUpdated(emit);
    } catch (_) {
      emit(LoadError());
    }
  }

  Future<void> _onOrderAdded(
    OrderAdded event,
    Emitter<OrderState> emit,
  ) async {
    try {
      emit(OrdersLoading());
      await _ordersRepository.placeOrder(event.order);
      await _userRepository.addOrderToCustomerList(event.userId, event.order);
      await _ordersListUpdated(emit);
    } catch (_) {
      emit(LoadError());
    }
  }

  Future<void> _onOrderDeleted(
    OrderDeleted event,
    Emitter<OrderState> emit,
  ) async {
    try {
      await _userRepository.deleteOrderFromCustomerList(
          event.userId, event.orderId);
      await _ordersRepository.deleteOrder(event.orderId);
      await _ordersListUpdated(emit);
    } catch (_) {
      emit(LoadError());
    }
  }

  Future<void> _onOrderUpdated(
    OrderSatusUpdated event,
    Emitter<OrderState> emit,
  ) async {
    try {
      emit(OrdersLoading());
      //TODO: implement updating an order status.
      await _ordersListUpdated(emit);
    } catch (_) {
      emit(LoadError());
    }
  }

  Future<void> _ordersListUpdated(Emitter<OrderState> emit) async {
    final orders = await _ordersRepository.getOrders();
    emit(OrdersLoaded(orders));
  }
}
