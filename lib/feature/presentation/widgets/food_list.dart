import 'package:flutter/material.dart';

import 'package:some_food/core/domain/entity/dish.dart';
import 'package:some_food/feature/presentation/widgets/food_list_item.dart';

class FoodList extends StatelessWidget {
  const FoodList({super.key, required this.list, required this.userId});
  final List<DishEntity> list;
  final String userId;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return FoodListItem(
          dishItem: list[index],
          userId: userId,
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 10,
        );
      },
    );
  }
}
