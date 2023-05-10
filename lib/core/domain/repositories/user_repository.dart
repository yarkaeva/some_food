import 'package:some_food/core/domain/entity/user.dart';

abstract class UserRepository {
  ///Adding user to DB.
  Future<void> addUser(UserEntity user);

  ///Checks if the person exists in the DB.
  Future<UserEntity?> checkUser(String email, String password);

  ///Checks if the email exists in the DB.
  Future<bool> checkEmail(String email);

  ///Get a user from DB.
  Future<UserEntity> getUser(String id);

  ///Deleting user from DB.
  Future<void> deleteUser(String id);
}
