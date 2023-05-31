import 'package:collection/collection.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:some_food/core/data/models/user_model.dart';
import 'package:some_food/core/domain/entity/dish.dart';
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
  Future<UserEntity> getUser(String userId) async {
    await _openDB();
    final user = await _getUserFromDB(userId);
    return user.toEntity();
  }

  @override
  Future<UserEntity> toogleUserRole(String userId) async {
    final user = await _getUserFromDB(userId);
    UserModel updatedUser;
    if (user.roleModel == RoleModel.customer) {
      updatedUser = user.copyWithM(roleModel: RoleModel.performer);
    } else {
      updatedUser = user.copyWithM(roleModel: RoleModel.customer);
    }
    await _putUpdatedUsertoDB(updatedUser);
    return updatedUser.toEntity();
  }

  @override
  Future<UserEntity?> checkUser(String email, String password) async {
    final storage = await _openDB();
    final logedUser = storage.values.firstWhereOrNull(
      (e) => e.email == email && e.password == password,
    );
    await storage.close();
    return logedUser?.toEntity();
  }

  @override
  Future<bool> checkEmail(String email) async {
    final storage = await _openDB();
    final isExist = storage.values.any((element) => element.email == email);
    await storage.close();
    return isExist;
  }

  @override
  Future<void> addOrderToCustomerList(String userId, String orderId) async {
    final user = await _getUserFromDB(userId);
    await _putUpdatedUsertoDB(
      user.copyWithM(
        customerList: user.customerList..add(orderId),
      ),
    );
  }

  @override
  Future<void> deleteOrderFromCustomerList(
      String userId, String orderId) async {
    final user = await _getUserFromDB(userId);
    await _putUpdatedUsertoDB(
      user.copyWithM(
        customerList: user.customerList..removeWhere((id) => id == orderId),
      ),
    );
  }

  @override
  Future<void> addOrderToPerformerList(String userId, String orderId) async {
    final user = await _getUserFromDB(userId);
    await _putUpdatedUsertoDB(
      user.copyWithM(
        perfomerList: user.perfomerList..add(orderId),
      ),
    );
  }

  @override
  Future<void> deleteOrderFromPerformerList(
      String userId, String orderId) async {
    final user = await _getUserFromDB(userId);
    await _putUpdatedUsertoDB(
      user.copyWithM(
        perfomerList: user.perfomerList..removeWhere((id) => id == orderId),
      ),
    );
  }

  @override
  Future<UserEntity> toggleFavorite(String userId, DishEntity dishItem) async {
    final user = await _getUserFromDB(userId);
    final favoriteList = user.favoriteList;
    final isFavorite = favoriteList.any((element) => element.id == dishItem.id);

    if (isFavorite) {
      favoriteList.removeWhere((element) => element.id == dishItem.id);
    } else {
      favoriteList.add(
        dishItem.copyWith(isFavorite: !dishItem.isFavorite).toModel(),
      );
    }
    final updatedUser = user.copyWithM(favoriteList: favoriteList);
    await _putUpdatedUsertoDB(updatedUser);

    return updatedUser;
  }
}

Future<Box<UserModel>> _openDB() async {
  final storage = await Hive.openBox<UserModel>('users');
  return storage;
}

Future<UserModel> _getUserFromDB(
  String userId,
) async {
  final storage = await Hive.openBox<UserModel>('users');
  final user = storage.values.firstWhere((element) => element.id == userId);
  return user;
}

Future<void> _putUpdatedUsertoDB(
  UserModel updatedUser,
) async {
  final storage = await _openDB();
  await storage.put(updatedUser.id, updatedUser);
  await storage.close();
}
