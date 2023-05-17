import 'package:some_food/core/data/popular_dishes.dart';
import 'package:some_food/core/domain/entity/dish.dart';
import 'package:some_food/core/domain/repositories/dish_repository.dart';

class DishRepositoryImpl extends DishRepository {
  @override
  List<DishEntity> getDishesWithFavorite(List<DishEntity> favoriteList) {
    final list = [...popularDishes];
    final favoriteListId = favoriteList.map((e) => e.id);
    for (var id in favoriteListId) {
      final dish = favoriteList.firstWhere((element) => element.id == id);
      final index = list.indexWhere((element) => element.id == id);
      list[index] = dish;
    }

    return list;
  }
}
