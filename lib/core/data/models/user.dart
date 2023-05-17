enum Role { customer, perfomer }

class UserModel {
  final String email;
  final String id;
  final String password;
  final Role role;

  UserModel({
    required this.email,
    required this.id,
    required this.password,
    required this.role,
  });
}
