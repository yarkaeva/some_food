import 'package:equatable/equatable.dart';
import 'package:some_food/core/data/models/user_model.dart';
import 'package:some_food/core/domain/entity/order.dart';

enum Role { customer, perfomer }

class UserEntity extends Equatable {
  final String id;
  final String email;
  final String password;
  final String name;
  final String address;
  final Role role;
  final List<OrderEntity>? customerList;
  final List<OrderEntity>? perfomerList;

  const UserEntity({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.address,
    required this.role,
    this.customerList,
    this.perfomerList,
  });

  UserEntity copyWith({
    String? email,
    String? id,
    String? password,
    String? name,
    String? address,
    Role? role,
    List<OrderEntity>? customerList,
    List<OrderEntity>? perfomerList,
  }) {
    return UserEntity(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      address: address ?? this.address,
      password: password ?? this.password,
      role: role ?? this.role,
    );
  }

  UserModel toModel() => UserModel(
        id: id,
        email: email,
        password: password,
        name: name,
        address: address,
        role: role,
        customerList: customerList?.map((e) => e.toModel()).toList(),
        perfomerList: perfomerList?.map((e) => e.toModel()).toList(),
      );

  @override
  List<Object?> get props =>
      [email, id, password, role, customerList, perfomerList];
}
