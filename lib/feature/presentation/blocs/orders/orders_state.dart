part of 'orders_bloc.dart';

abstract class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

class OrderInitial extends OrderState {}

class OrdersLoading extends OrderState {}

class OrdersLoaded extends OrderState {
  final List<OrderEntity> orders;
  const OrdersLoaded(this.orders);

  @override
  List<Object> get props => [orders];
}

class LoadError extends OrderState {}
// class OrdersUpdated extends OrderState {
//   final List<OrderEntity> orders;
//   const OrdersUpdated(this.orders);
// }
