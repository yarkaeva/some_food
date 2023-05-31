part of 'orders_bloc.dart';

abstract class OrdersEvent extends Equatable {
  const OrdersEvent();

  @override
  List<Object> get props => [];
}

class PlacedOrdersLoad extends OrdersEvent {
  final String userId;

  const PlacedOrdersLoad({required this.userId});
}

class CustomerOrdersLoad extends OrdersEvent {
  final String userId;

  const CustomerOrdersLoad({required this.userId});
}

class PerformerOrdersLoad extends OrdersEvent {
  final String userId;

  const PerformerOrdersLoad({required this.userId});
}

class OrderAdded extends OrdersEvent {
  final String userId;
  final OrderEntity order;
  const OrderAdded({required this.order, required this.userId});
}

class OrderTaked extends OrdersEvent {
  final String userId;
  final String orderId;
  const OrderTaked({required this.orderId, required this.userId});
}

class OrderRefused extends OrdersEvent {
  final String userId;
  final String orderId;
  const OrderRefused({
    required this.userId,
    required this.orderId,
  });
}

class OrderDeleted extends OrdersEvent {
  final String userId;
  final String orderId;
  const OrderDeleted({
    required this.userId,
    required this.orderId,
  });
}

class OrderFinished extends OrdersEvent {
  final String userId;
  final String orderId;
  const OrderFinished({
    required this.userId,
    required this.orderId,
  });
}

class OrderClosed extends OrdersEvent {
  final String userId;
  final String orderId;
  const OrderClosed({
    required this.userId,
    required this.orderId,
  });
}
