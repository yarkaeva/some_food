import 'package:hive_flutter/hive_flutter.dart';
import 'package:some_food/core/data/models/user_model.dart';
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
  Future<void> deleteUser(String id) async {
    final storage = await Hive.openBox<UserModel>('users');
    await storage.delete(id);
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
  Future<UserEntity> getUser(String id) async {
    final storage = await Hive.openBox<UserModel>('users');
    final user = storage.values.firstWhere((element) => element.id == id);
    return user;
  }

  @override
  Future<void> updateUserOrders() {
    // TODO: implement updateUserOrders
    throw UnimplementedError();
  }
}
