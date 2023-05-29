import 'package:hive_flutter/hive_flutter.dart';
import 'package:some_food/core/data/models/order_model.dart';
import 'package:some_food/core/domain/entity/order.dart';
import 'package:some_food/core/domain/repositories/order_repository.dart';

class OrderRepositoryImpl extends OrderRepository {
  @override
  Future<List<OrderEntity>> getAllOrders() async {
    final storage = await Hive.openBox<OrderModel>('orders');
    final listOfOrders = storage.values.map((e) => e.toEntity()).toList();
    await storage.close();
    return listOfOrders;
  }

  @override
  Future<List<OrderEntity>> getPlacedOrders() async {
    final storage = await Hive.openBox<OrderModel>('orders');
    final listPlacedOrders = storage.values
        .where((element) => element.statusModel == OrderStatusModel.placed)
        .map((e) => e.toEntity())
        .toList();
    await storage.close();
    return listPlacedOrders;
  }

  @override
  Future<void> placeOrder(OrderEntity order) async {
    final storage = await Hive.openBox<OrderModel>('orders');
    await storage.put(order.id, order.toModel());
    await storage.close();
  }

  @override
  Future<void> deleteOrder(String orderId) async {
    final storage = await Hive.openBox<OrderModel>('orders');
    await storage.delete(orderId);
    await storage.close();
  }

  @override
  Future<OrderEntity> updateOrderStatus(
      String orderId, OrderStatus status) async {
    final storage = await Hive.openBox<OrderModel>('orders');
    var order = storage.values.firstWhere((element) => element.id == orderId);

    switch (status) {
      case OrderStatus.placed:
        order = order.copyWith(statusModel: OrderStatusModel.placed);
        break;
      case OrderStatus.inProgress:
        order = order.copyWith(statusModel: OrderStatusModel.inProgress);
        break;
      case OrderStatus.done:
        order = order.copyWith(statusModel: OrderStatusModel.done);
        break;
      case OrderStatus.closed:
        order = order.copyWith(statusModel: OrderStatusModel.closed);
        break;
    }
    await storage.put(order.id, order);
    await storage.close();
    return order.toEntity();
  }
}
