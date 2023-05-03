import 'package:some_food/core/domain/entity/user.dart';

abstract class UserRepository {
  ///Adding user to DB.
  Future<void> addUser(UserEntity user);

  ///Get a user from DB.
  Future<UserEntity?> getUser(String email, String password);

  ///Deleting user from DB.
  Future<void> deleteUser(String id);
}
