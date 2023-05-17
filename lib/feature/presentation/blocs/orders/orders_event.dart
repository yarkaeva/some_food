part of 'orders_bloc.dart';

abstract class OrdersEvent extends Equatable {
  const OrdersEvent();

  @override
  List<Object> get props => [];
}

class FirstLoad extends OrdersEvent {}

class OrderAdded extends OrdersEvent {
  final String userId;
  final OrderEntity order;
  const OrderAdded({required this.order, required this.userId});
}

class OrderDeleted extends OrdersEvent {
  final String userId;
  final String orderId;
  const OrderDeleted({
    required this.userId,
    required this.orderId,
  });
}

class OrderSatusUpdated extends OrdersEvent {}
