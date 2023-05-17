abstract class UserRepository {
  ///Adding user to DB.
  Future<void> addUser();

  ///Get a user from DB.
  Future<void> getUser();

  ///Deleting user from DB.
  Future<void> deleteUser();
}
