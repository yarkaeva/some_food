// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 0;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      id: fields[1] as String,
      email: fields[0] as String,
      password: fields[2] as String,
      name: fields[6] as String,
      address: fields[7] as String,
      roleModel: fields[3] as RoleModel,
      customerList: (fields[4] as List).cast<OrderModel>(),
      perfomerList: (fields[5] as List).cast<OrderModel>(),
      favoriteList: (fields[8] as List).cast<DishModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.email)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.password)
      ..writeByte(3)
      ..write(obj.roleModel)
      ..writeByte(4)
      ..write(obj.customerList)
      ..writeByte(5)
      ..write(obj.perfomerList)
      ..writeByte(6)
      ..write(obj.name)
      ..writeByte(7)
      ..write(obj.address)
      ..writeByte(8)
      ..write(obj.favoriteList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RoleModelAdapter extends TypeAdapter<RoleModel> {
  @override
  final int typeId = 1;

  @override
  RoleModel read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return RoleModel.customer;
      case 1:
        return RoleModel.performer;
      default:
        return RoleModel.customer;
    }
  }

  @override
  void write(BinaryWriter writer, RoleModel obj) {
    switch (obj) {
      case RoleModel.customer:
        writer.writeByte(0);
        break;
      case RoleModel.performer:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RoleModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
