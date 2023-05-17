part of 'orders_bloc.dart';

abstract class OrdersEvent extends Equatable {
  const OrdersEvent();

  @override
  List<Object> get props => [];
}

class OrderAdded extends OrdersEvent {
  final OrderEntity order;
  const OrderAdded({required this.order});
}

class OrderDeleted extends OrdersEvent {
  final String id;
  const OrderDeleted({required this.id});
}

class OrderSatusUpdated extends OrdersEvent {}
