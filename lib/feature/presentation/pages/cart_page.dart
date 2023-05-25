import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:some_food/core/domain/entity/user.dart';
import 'package:some_food/feature/presentation/blocs/cubits/user_role.dart';
import 'package:some_food/feature/presentation/widgets/customer_orders_list.dart';
import 'package:some_food/feature/presentation/widgets/performer_orders_list.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key, required this.user});
  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Заказы',
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
      body: BlocBuilder<UserRoleCubit, RoleState>(
        builder: (context, state) {
          if (state == RoleState.customer) {
            return CustomerOrdersList(
              userId: user.id,
            );
          } else if (state == RoleState.performer) {
            return PerformerOrdersList(
              userId: user.id,
            );
          } else {
            return const Text('что-то пошло не так :(');
          }
        },
      ),
    );
  }
}
