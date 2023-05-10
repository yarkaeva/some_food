import 'package:flutter/material.dart';
import 'package:some_food/core/data/popular_dishes.dart';
import 'package:some_food/feature/presentation/widgets/food_list_item.dart';

class PopularFoodList extends StatelessWidget {
  const PopularFoodList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      itemCount: popularDishes.length,
      itemBuilder: (context, index) {
        return FoodListItem(
          dishItem: popularDishes[index],
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
