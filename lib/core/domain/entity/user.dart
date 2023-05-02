enum Role { customer, perfomer }

class UserEntity {
  final String email;
  final String id;
  final String password;
  final Role role;

  UserEntity({
    required this.email,
    required this.id,
    required this.password,
    required this.role,
  });
}
