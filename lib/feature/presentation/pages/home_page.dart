import 'package:flutter/material.dart';
import 'package:some_food/core/domain/entity/dish.dart';
import 'package:some_food/core/domain/entity/user.dart';
import 'package:some_food/feature/presentation/widgets/food_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.user,
    required this.list,
  });
  final UserEntity user;
  final List<DishEntity> list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Привет, ${user.name}',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.logout_outlined,
            ),
          ),
        ],
      ),
      body: FoodList(
        list: list,
        userId: user.id,
      ),
    );
  }
}
