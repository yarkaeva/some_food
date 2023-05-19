import 'package:hive_flutter/hive_flutter.dart';
import 'package:some_food/core/data/models/user_model.dart';
import 'package:some_food/core/domain/entity/dish.dart';
import 'package:some_food/core/domain/entity/order.dart';
import 'package:some_food/core/domain/entity/user.dart';
import 'package:some_food/core/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  @override
  Future<void> addUser(UserEntity user) async {
    final storage = await _openDB();
    await storage.put(user.id, user.toModel());
    await storage.close();
  }

  @override
  Future<void> deleteUser(String userId) async {
    final storage = await _openDB();
    await storage.delete(userId);
    await storage.close();
  }

  @override
  Future<UserEntity> toogleUserRole(String userId) async {
    final storage = await _openDB();
    final user = await _getUserFromDB(storage, userId);
    UserModel updatedUser;
    if (user.roleModel == RoleModel.customer) {
      updatedUser = user.copyWithM(roleModel: RoleModel.performer);
      await _putUptadedUsertoDB(storage, userId, updatedUser);
    } else {
      updatedUser = user.copyWithM(roleModel: RoleModel.customer);
      await _putUptadedUsertoDB(storage, userId, updatedUser);
    }
    return updatedUser.toEntity();
  }

  @override
  Future<UserEntity?> checkUser(String email, String password) async {
    final storage = await _openDB();
    try {
      final logedUser = storage.values
          .firstWhere((e) => e.email == email && e.password == password)
          .toEntity();
      await storage.close();
      return logedUser;
    } catch (e) {
      await storage.close();
      return null;
    }
  }

  @override
  Future<bool> checkEmail(String email) async {
    final storage = await _openDB();
    final isExist = storage.values.any((element) => element.email == email);
    await storage.close();
    return isExist;
  }

  @override
  Future<UserEntity> getUser(String userId) async {
    final storage = await _openDB();
    final user = await _getUserFromDB(storage, userId);
    await storage.close();
    return user.toEntity();
  }

  @override
  Future<void> addOrderToCustomerList(String userId, OrderEntity order) async {
    final storage = await _openDB();
    final user = await _getUserFromDB(storage, userId);

    final customerList = user.customerList..add(order.toModel());

    await _putUptadedUsertoDB(
        storage, userId, user.copyWithM(customerList: customerList));
  }

  @override
  Future<void> deleteOrderFromCustomerList(
      String userId, String orderId) async {
    final storage = await _openDB();
    final user = await _getUserFromDB(storage, userId);
    final customerList = user.customerList
      ..removeWhere((order) => order.id == orderId);

    await _putUptadedUsertoDB(
      storage,
      userId,
      user.copyWithM(customerList: customerList),
    );
  }

  @override
  Future<UserEntity> toggleFavorite(String userId, DishEntity dishItem) async {
    final storage = await _openDB();
    final user = await _getUserFromDB(storage, userId);
    final favoriteList = user.favoriteList;
    final isExist = favoriteList.any((element) => element.id == dishItem.id);
    final dishModel =
        dishItem.copyWith(isFavorite: !dishItem.isFavorite).toModel();

    if (isExist) {
      favoriteList.removeWhere((element) => element.id == dishItem.id);
    } else {
      favoriteList.add(dishModel);
    }
    final uptadedUser = user.copyWithM(favoriteList: favoriteList);

    await _putUptadedUsertoDB(storage, userId, uptadedUser);
    return uptadedUser;
  }

  Future<Box<UserModel>> _openDB() async {
    final storage = await Hive.openBox<UserModel>('users');
    return storage;
  }

  Future<UserModel> _getUserFromDB(
    Box<UserModel> storage,
    String userId,
  ) async {
    final user = storage.values.firstWhere((element) => element.id == userId);
    return user;
  }

  Future<void> _putUptadedUsertoDB(
    Box<UserModel> storage,
    String userId,
    UserModel uptadedUser,
  ) async {
    await storage.put(userId, uptadedUser);
    await storage.close();
  }
}
