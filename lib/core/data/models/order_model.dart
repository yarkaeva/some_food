import 'package:some_food/core/domain/entity/order.dart';

class OrderModel extends OrderEntity {
  OrderModel({
    required super.dish,
    required super.price,
    required super.cookingTime,
    required super.amount,
    required super.status,
  });
}

  // final DishEntity dish;
  // final int price;
  // final int cookingTime;
  // final int amount;
  // final OrderStatus status;