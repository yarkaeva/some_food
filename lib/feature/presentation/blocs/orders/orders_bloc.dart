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
    on<CustomerOrdersLoad>(_onCustomerOrdersLoad);
    on<OrderAdded>(_onOrderAdded);
    on<OrderDeleted>(_onOrderDeleted);
    on<PlacedOrdersLoad>(_onPlacedOrderLoad);
    on<PerformerOrdersLoad>(_onPerformerOrdersLoad);
    on<OrderTaked>(_onOrderTaked);
    on<OrderRefused>(_onOrderRefused);
    on<OrderFinished>(_onOrderFinished);
    on<OrderClosed>(_onOrderClosed);
  }
  final OrderRepository _ordersRepository;
  final UserRepository _userRepository;

  Future<void> _onPlacedOrderLoad(
    PlacedOrdersLoad event,
    Emitter<OrderState> emit,
  ) async {
    try {
      emit(OrdersLoading());
      final placedOrders = await _ordersRepository.getPlacedOrders();
      emit(OrdersLoaded(placedOrders));
    } catch (_) {
      emit(LoadError());
    }
  }

  Future<void> _onCustomerOrdersLoad(
    CustomerOrdersLoad event,
    Emitter<OrderState> emit,
  ) async {
    try {
      emit(OrdersLoading());
      final user = await _userRepository.getUser(event.userId);
      final ordersId = user.customerList;
      final allOrders = await _ordersRepository.getAllOrders();
      final customerOrders = _generaterOrdersList(ordersId, allOrders).toList();
      emit(OrdersLoaded(customerOrders));
    } catch (_) {
      emit(LoadError());
    }
  }

  Future<void> _onPerformerOrdersLoad(
    PerformerOrdersLoad event,
    Emitter<OrderState> emit,
  ) async {
    try {
      emit(OrdersLoading());
      final user = await _userRepository.getUser(event.userId);
      final ordersId = user.perfomerList;
      final allOrders = await _ordersRepository.getAllOrders();
      final performerOrders =
          _generaterOrdersList(ordersId, allOrders).toList();
      emit(OrdersLoaded(performerOrders));
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
      await _userRepository.addOrderToCustomerList(
          event.userId, event.order.id);
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
    } catch (_) {
      emit(LoadError());
    }
  }

  Future<void> _onOrderTaked(
    OrderTaked event,
    Emitter<OrderState> emit,
  ) async {
    try {
      emit(OrdersLoading());

      await _ordersRepository.updateOrderStatus(
          event.orderId, OrderStatus.inProgress);
      await _userRepository.addOrderToPerformerList(
          event.userId, event.orderId);

      final placedOrders = await _ordersRepository.getPlacedOrders();
      emit(OrdersLoaded(placedOrders));
    } catch (_) {
      emit(LoadError());
    }
  }

  Future<void> _onOrderRefused(
    OrderRefused event,
    Emitter<OrderState> emit,
  ) async {
    try {
      await _userRepository.deleteOrderFromPerformerList(
          event.userId, event.orderId);
      await _ordersRepository.updateOrderStatus(
          event.orderId, OrderStatus.placed);

      final user = await _userRepository.getUser(event.userId);
      final ordersId = user.perfomerList;
      final allOrders = await _ordersRepository.getAllOrders();
      final performerOrders =
          _generaterOrdersList(ordersId, allOrders).toList();

      emit(OrdersLoaded(performerOrders));
    } catch (_) {
      emit(LoadError());
    }
  }

  Future<void> _onOrderFinished(
    OrderFinished event,
    Emitter<OrderState> emit,
  ) async {
    try {
      emit(OrdersLoading());
      await _ordersRepository.updateOrderStatus(
          event.orderId, OrderStatus.done);

      final user = await _userRepository.getUser(event.userId);
      final ordersId = user.perfomerList;
      final allOrders = await _ordersRepository.getAllOrders();
      final performerOrders =
          _generaterOrdersList(ordersId, allOrders).toList();

      emit(OrdersLoaded(performerOrders));
    } catch (_) {
      emit(LoadError());
    }
  }

  Future<void> _onOrderClosed(
    OrderClosed event,
    Emitter<OrderState> emit,
  ) async {
    try {
      emit(OrdersLoading());
      await _ordersRepository.updateOrderStatus(
          event.orderId, OrderStatus.closed);

      final user = await _userRepository.getUser(event.userId);
      final ordersId = user.perfomerList;
      final allOrders = await _ordersRepository.getAllOrders();
      final performerOrders =
          _generaterOrdersList(ordersId, allOrders).toList();

      emit(OrdersLoaded(performerOrders));
    } catch (_) {
      emit(LoadError());
    }
  }
}

Iterable<OrderEntity> _generaterOrdersList(
    List<String> ordersId, List<OrderEntity> orders) sync* {
  for (var id in ordersId) {
    var order = orders.firstWhere((element) => element.id == id);
    yield order;
  }
}
