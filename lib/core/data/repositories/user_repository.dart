import 'package:hive_flutter/hive_flutter.dart';
import 'package:some_food/core/data/models/user_model.dart';
import 'package:some_food/core/domain/entity/dish.dart';
import 'package:some_food/core/domain/entity/user.dart';
import 'package:some_food/core/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  @override
  Future<void> addUser(UserEntity user) async {
    final storage = await Hive.openBox<UserModel>('users');
    await storage.put(user.id, user.toModel());
    await storage.close();
  }

  @override
  Future<void> deleteUser(String userId) async {
    final storage = await Hive.openBox<UserModel>('users');
    await storage.delete(userId);
    await storage.close();
  }

  @override
  Future<UserEntity?> checkUser(String email, String password) async {
    final storage = await Hive.openBox<UserModel>('users');
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
    final storage = await Hive.openBox<UserModel>('users');
    final isExist = storage.values.any((element) => element.email == email);
    await storage.close();
    return isExist;
  }

  @override
  Future<UserEntity> getUser(String userId) async {
    final storage = await Hive.openBox<UserModel>('users');
    final user = storage.values.firstWhere((element) => element.id == userId);
    await storage.close();
    return user;
  }

  @override
  Future<void> updateUserOrders() {
    // TODO: implement updateUserOrders
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> toggleFavorite(String userId, DishEntity dishItem) async {
    final storage = await Hive.openBox<UserModel>('users');
    final user = storage.values.firstWhere((user) => user.id == userId);
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
    await storage.put(userId, uptadedUser);
    await storage.close();
    return uptadedUser;
  }
}
