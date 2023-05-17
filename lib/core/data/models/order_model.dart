// ignore_for_file: overridden_fields, annotate_overrides

import 'package:some_food/core/data/models/dish_model.dart';
import 'package:some_food/core/domain/entity/order.dart';
import 'package:hive_flutter/adapters.dart';

part 'order_model.g.dart';

@HiveType(typeId: 3)
enum OrderStatusModel {
  @HiveField(0)
  placed,
  @HiveField(1)
  inProgress,
  @HiveField(2)
  done,
  @HiveField(3)
  closed;

  OrderStatus get statusEnum {
    switch (this) {
      case OrderStatusModel.placed:
        return OrderStatus.placed;
      case OrderStatusModel.inProgress:
        return OrderStatus.inProgress;
      case OrderStatusModel.done:
        return OrderStatus.done;
      case OrderStatusModel.closed:
        return OrderStatus.closed;
      default:
        return OrderStatus.placed;
    }
  }
}

@HiveType(typeId: 2)
class OrderModel extends OrderEntity {
  @HiveField(0)
  final DishModel dish;
  @HiveField(1)
  final int price;
  @HiveField(2)
  final int cookingTime;
  @HiveField(3)
  final int amount;
  @HiveField(4)
  final OrderStatusModel statusModel;
  @HiveField(5)
  final String id;

  OrderModel({
    required this.dish,
    required this.price,
    required this.cookingTime,
    required this.amount,
    required this.statusModel,
    required this.id,
  }) : super(
          dish: dish,
          price: price,
          cookingTime: cookingTime,
          amount: amount,
          status: statusModel.statusEnum,
          id: id,
        );

  OrderEntity toEntity() => OrderEntity(
      dish: dish,
      price: price,
      cookingTime: cookingTime,
      amount: amount,
      status: statusModel.statusEnum,
      id: id);
}
