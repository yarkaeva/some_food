// ignore_for_file: overridden_fields, annotate_overrides

import 'package:some_food/core/data/models/order_model.dart';
import 'package:some_food/core/domain/entity/order.dart';
import 'package:some_food/core/domain/entity/user.dart';
import 'package:hive_flutter/adapters.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1)
enum RoleModel {
  @HiveField(0)
  customer,
  @HiveField(1)
  performer,
}

@HiveType(typeId: 0)
class UserModel extends UserEntity {
  @HiveField(0)
  final String email;
  @HiveField(1)
  final String id;
  @HiveField(2)
  final String password;
  @HiveField(3)
  final RoleModel roleModel;
  @HiveField(4)
  final List<OrderModel>? customerList;
  @HiveField(5)
  final List<OrderModel>? perfomerList;
  @HiveField(6)
  final String name;
  @HiveField(7)
  final String address;

  const UserModel({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.address,
    required this.roleModel,
    this.customerList,
    this.perfomerList,
  }) : super(
          id: id,
          email: email,
          password: password,
          role: roleModel == RoleModel.customer ? Role.customer : Role.perfomer,
          name: name,
          address: address,
          customerList: customerList,
          perfomerList: perfomerList,
        );

  UserEntity toEntity() => UserEntity(
        email: email,
        id: id,
        password: password,
        name: name,
        address: address,
        role: role,
        customerList: customerList,
        perfomerList: perfomerList,
      );

  @override
  UserModel copyWith({
    String? id,
    String? email,
    String? password,
    String? name,
    String? address,
    Role? role,
    List<OrderEntity>? customerList,
    List<OrderEntity>? perfomerList,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      address: address ?? this.address,
      password: password ?? this.password,
      roleModel: role == null
          ? roleModel
          : role == Role.customer
              ? RoleModel.customer
              : RoleModel.performer,
    );
  }
}
