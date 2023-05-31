import 'package:equatable/equatable.dart';
import 'package:some_food/core/data/models/user_model.dart';
import 'package:some_food/core/domain/entity/dish.dart';

enum Role { customer, perfomer }

class UserEntity extends Equatable {
  final String id;
  final String email;
  final String password;
  final String name;
  final String address;
  final Role role;
  final List<String> customerList;
  final List<String> perfomerList;
  final List<DishEntity> favoriteList;

  const UserEntity({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.address,
    required this.role,
    this.customerList = const [],
    this.perfomerList = const [],
    this.favoriteList = const [],
  });

  UserEntity copyWith({
    String? email,
    String? password,
    String? name,
    String? address,
    Role? role,
    List<String>? customerList,
    List<String>? perfomerList,
    List<DishEntity>? favoriteList,
  }) {
    return UserEntity(
      id: id,
      email: email ?? this.email,
      name: name ?? this.name,
      address: address ?? this.address,
      password: password ?? this.password,
      role: role ?? this.role,
      customerList: customerList ?? this.customerList,
      perfomerList: perfomerList ?? this.perfomerList,
      favoriteList: favoriteList ?? this.favoriteList,
    );
  }

  UserModel toModel() => UserModel(
        id: id,
        email: email,
        password: password,
        name: name,
        address: address,
        roleModel:
            role == Role.customer ? RoleModel.customer : RoleModel.performer,
        customerList: customerList,
        perfomerList: perfomerList,
        favoriteList: favoriteList.map((e) => e.toModel()).toList(),
      );

  @override
  List<Object?> get props =>
      [email, id, password, role, customerList, perfomerList, favoriteList];
}
