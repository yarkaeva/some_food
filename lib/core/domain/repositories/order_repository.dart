import 'package:some_food/core/domain/entity/order.dart';

abstract class OrderRepository {
  Future<List<OrderEntity>> getOrders();

  Future<void> placeOrder(OrderEntity order);

  Future<void> updateOrderStatus(String orderId);

  Future<void> deleteOrder(String orderId);
}
