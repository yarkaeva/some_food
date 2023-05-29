import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:some_food/core/domain/entity/user.dart';
import 'package:some_food/feature/presentation/auth/cubit/auth_cubit.dart';
import 'package:some_food/feature/presentation/widgets/food_list.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key, required this.user});
  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Любимое',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        actions: [
          IconButton(
            onPressed: () => context.read<AuthCubit>().logout(),
            icon: const Icon(
              Icons.logout_outlined,
            ),
          ),
        ],
      ),
      body: FoodList(
        list: user.favoriteList,
        userId: user.id,
      ),
    );
  }
}
