import 'package:some_food/core/data/models/dish_model.dart';

class DishEntity {
  final String title;
  final String description;
  final String url;

  DishEntity({
    required this.title,
    required this.description,
    required this.url,
  });

  DishModel toModel() => DishModel(
        title: title,
        description: description,
        url: url,
      );
}
