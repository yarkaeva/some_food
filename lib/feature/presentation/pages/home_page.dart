import 'package:flutter/material.dart';
import 'package:some_food/core/domain/entity/user.dart';
import 'package:some_food/feature/presentation/widgets/popular_food_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.user});
  final UserEntity user;

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
      body: const PopularFoodList(),
    );
  }
}
