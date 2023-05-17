// ignore_for_file: overridden_fields, annotate_overrides

import 'package:some_food/core/data/models/dish_model.dart';
import 'package:some_food/core/data/models/order_model.dart';
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
  final List<OrderModel> customerList;
  @HiveField(5)
  final List<OrderModel> perfomerList;
  @HiveField(6)
  final String name;
  @HiveField(7)
  final String address;
  @HiveField(8)
  final List<DishModel> favoriteList;

  const UserModel({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.address,
    required this.roleModel,
    this.customerList = const [],
    this.perfomerList = const [],
    this.favoriteList = const [],
  }) : super(
          id: id,
          email: email,
          password: password,
          role: roleModel == RoleModel.customer ? Role.customer : Role.perfomer,
          name: name,
          address: address,
          customerList: customerList,
          perfomerList: perfomerList,
          favoriteList: favoriteList,
        );

  UserEntity toEntity() => UserEntity(
        email: email,
        id: id,
        password: password,
        name: name,
        address: address,
        role: roleModel == RoleModel.customer ? Role.customer : Role.perfomer,
        customerList: customerList,
        perfomerList: perfomerList,
        favoriteList: favoriteList,
      );

  UserModel copyWithM({
    String? email,
    String? password,
    String? name,
    String? address,
    RoleModel? roleModel,
    List<OrderModel>? customerList,
    List<OrderModel>? perfomerList,
    List<DishModel>? favoriteList,
  }) {
    return UserModel(
      id: id,
      email: email ?? this.email,
      name: name ?? this.name,
      address: address ?? this.address,
      password: password ?? this.password,
      favoriteList: favoriteList ?? this.favoriteList,
      customerList: customerList ?? this.customerList,
      perfomerList: perfomerList ?? this.perfomerList,
      roleModel: roleModel ?? this.roleModel,
    );
  }
}
