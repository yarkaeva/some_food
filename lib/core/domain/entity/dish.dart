import 'package:equatable/equatable.dart';
import 'package:some_food/core/data/models/dish_model.dart';

class DishEntity extends Equatable {
  final int id;
  final String title;
  final String description;
  final String url;
  final bool isFavorite;

  const DishEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.url,
    this.isFavorite = false,
  });

  DishModel toModel() => DishModel(
        id: id,
        title: title,
        description: description,
        url: url,
        isFavorite: isFavorite,
      );

  DishEntity copyWith({
    String? title,
    String? description,
    String? url,
    bool? isFavorite,
  }) =>
      DishEntity(
        id: id,
        title: title ?? this.title,
        description: description ?? this.description,
        url: url ?? this.url,
        isFavorite: isFavorite ?? this.isFavorite,
      );

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        url,
        isFavorite,
      ];
}
