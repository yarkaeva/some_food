import 'package:some_food/core/domain/entity/dish.dart';

abstract class DishRepository {
  ///Gets popular dishes list with actual Favorite status.
  List<DishEntity> getDishesWithFavorite(List<DishEntity> favoriteList);
}
