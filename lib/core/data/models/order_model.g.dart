// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderModelAdapter extends TypeAdapter<OrderModel> {
  @override
  final int typeId = 2;

  @override
  OrderModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderModel(
      dish: fields[0] as DishModel,
      price: fields[1] as int,
      cookingTime: fields[2] as int,
      amount: fields[3] as int,
      statusModel: fields[4] as OrderStatusModel,
    );
  }

  @override
  void write(BinaryWriter writer, OrderModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.dish)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.cookingTime)
      ..writeByte(3)
      ..write(obj.amount)
      ..writeByte(4)
      ..write(obj.statusModel);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OrderStatusModelAdapter extends TypeAdapter<OrderStatusModel> {
  @override
  final int typeId = 3;

  @override
  OrderStatusModel read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return OrderStatusModel.placed;
      case 1:
        return OrderStatusModel.inProgress;
      case 2:
        return OrderStatusModel.done;
      case 3:
        return OrderStatusModel.closed;
      default:
        return OrderStatusModel.placed;
    }
  }

  @override
  void write(BinaryWriter writer, OrderStatusModel obj) {
    switch (obj) {
      case OrderStatusModel.placed:
        writer.writeByte(0);
        break;
      case OrderStatusModel.inProgress:
        writer.writeByte(1);
        break;
      case OrderStatusModel.done:
        writer.writeByte(2);
        break;
      case OrderStatusModel.closed:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderStatusModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
