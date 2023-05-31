import 'package:some_food/core/domain/entity/order.dart';

abstract class OrderRepository {
  ///Get all orders from DB.
  Future<List<OrderEntity>> getAllOrders();

  ///Get placed orders from DB.
  Future<List<OrderEntity>> getPlacedOrders();

  ///Place order into DB.
  Future<void> placeOrder(OrderEntity order);

  ///Takes new order status and update it in DB.
  Future<OrderEntity> updateOrderStatus(String orderId, OrderStatus status);

//Delete order from DB.
  Future<void> deleteOrder(String orderId);
}
