import 'package:some_food/core/domain/entity/dish.dart';

enum OrderStatus { placed, inProgress, done, closed }

class OrderEntity {
  final DishEntity dish;
  final int price;
  final int cookingTime;
  final int amount;
  final OrderStatus status;

  OrderEntity({
    required this.dish,
    required this.price,
    required this.cookingTime,
    required this.amount,
    required this.status,
  });
}
