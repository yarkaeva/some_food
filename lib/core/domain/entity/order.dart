import 'package:some_food/core/data/models/order_model.dart';
import 'package:some_food/core/domain/entity/dish.dart';

enum OrderStatus {
  placed,
  inProgress,
  done,
  closed;

  OrderStatusModel get statusModel {
    switch (this) {
      case OrderStatus.placed:
        return OrderStatusModel.placed;
      case OrderStatus.inProgress:
        return OrderStatusModel.inProgress;
      case OrderStatus.done:
        return OrderStatusModel.done;
      case OrderStatus.closed:
        return OrderStatusModel.closed;
      default:
        return OrderStatusModel.placed;
    }
  }
}

class OrderEntity {
  final DishEntity dish;
  final int price;
  final int cookingTime;
  final int amount;
  final OrderStatus status;

  const OrderEntity({
    required this.dish,
    required this.price,
    required this.cookingTime,
    required this.amount,
    required this.status,
  });

  OrderModel toModel() => OrderModel(
      dish: dish.toModel(),
      price: price,
      cookingTime: cookingTime,
      amount: amount,
      statusModel: status.statusModel);
}
