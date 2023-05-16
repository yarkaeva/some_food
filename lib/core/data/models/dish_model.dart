// ignore_for_file: annotate_overrides, overridden_fields

import 'package:hive_flutter/adapters.dart';
import 'package:some_food/core/domain/entity/dish.dart';

part 'dish_model.g.dart';

@HiveType(typeId: 4)
class DishModel extends DishEntity {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final String url;
  @HiveField(3)
  final bool isFavorite;
  @HiveField(4)
  final int id;

  const DishModel({
    required this.id,
    required this.title,
    required this.description,
    required this.url,
    required this.isFavorite,
  }) : super(
          id: id,
          title: title,
          description: description,
          url: url,
        );
}
