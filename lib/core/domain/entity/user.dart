import 'package:equatable/equatable.dart';
import 'package:some_food/core/domain/entity/order.dart';

enum Role { customer, perfomer }

class UserEntity extends Equatable {
  final String email;
  final String id;
  final String password;
  final Role role;
  final List<OrderEntity>? customerList;
  final List<OrderEntity>? perfomerList;

  const UserEntity({
    required this.email,
    required this.id,
    required this.password,
    required this.role,
    this.customerList,
    this.perfomerList,
  });

  UserEntity copyWith({
    String? email,
    String? id,
    String? password,
    Role? role,
    List<OrderEntity>? customerList,
    List<OrderEntity>? perfomerList,
  }) {
    return UserEntity(
      email: email ?? this.email,
      id: id ?? this.id,
      password: password ?? this.password,
      role: role ?? this.role,
    );
  }

  @override
  List<Object?> get props =>
      [email, id, password, role, customerList, perfomerList];
}
