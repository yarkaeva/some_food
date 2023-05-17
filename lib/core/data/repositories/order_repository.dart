import 'package:hive_flutter/hive_flutter.dart';
import 'package:some_food/core/data/models/order_model.dart';
import 'package:some_food/core/domain/entity/order.dart';
import 'package:some_food/core/domain/repositories/order_repository.dart';

class OrderRepositoryImpl extends OrderRepository {
  @override
  Future<List<OrderEntity>> getOrders() async {
    final storage = await Hive.openBox<OrderModel>('orders');
    final listOfOrders = storage.values.map((e) => e.toEntity()).toList();
    await storage.close();
    return listOfOrders;
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
  Future<void> updateOrderStatus(String id) {
    // TODO: implement updateOrderStatus
    throw UnimplementedError();
  }
}
