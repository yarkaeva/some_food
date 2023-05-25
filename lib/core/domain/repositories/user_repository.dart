import 'package:some_food/core/domain/entity/dish.dart';
import 'package:some_food/core/domain/entity/order.dart';
import 'package:some_food/core/domain/entity/user.dart';

abstract class UserRepository {
  ///Adding user to DB.
  Future<void> addUser(UserEntity user);

  ///Checks if the person exists in the DB.
  Future<UserEntity?> checkUser(String email, String password);

  ///Checks if the email exists in the DB.
  Future<bool> checkEmail(String email);

  ///Get a user from DB.
  Future<UserEntity> getUser(String userId);

  ///Deleting user from DB.
  Future<void> deleteUser(String userId);

  ///Update user role from DB.
  Future<UserEntity> toogleUserRole(String userId);

  ///Toggle isFavorite for items in list of User favorite dishes.
  Future<UserEntity> toggleFavorite(String userId, DishEntity dishItem);

  ///Adding item to customer list.
  Future<void> addOrderToCustomerList(String userId, String orderId);

  ///Delete item to customer list.
  Future<void> deleteOrderFromCustomerList(String userId, String orderId);

  ///Adding item to performer list.
  Future<void> addOrderToPerformerList(String userId, String orderId);

  ///Delete item to performer list.
  Future<void> deleteOrderFromPerformerList(String userId, String orderId);
}
