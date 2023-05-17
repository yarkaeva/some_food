import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:some_food/feature/presentation/blocs/orders/orders_bloc.dart';
import 'package:some_food/feature/presentation/widgets/cart_food_list_item.dart';

class CartFoodList extends StatelessWidget {
  const CartFoodList({
    super.key,
    required this.userId,
  });
  final String userId;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersBloc, OrderState>(
      builder: (context, state) {
        if (state is OrdersLoaded) {
          return ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            itemCount: state.orders.length,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'АКТИВНЫЕ ЗАКАЗЫ',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CartFoodListItem(
                      userId: userId,
                      orderItem: state.orders[index],
                    ),
                  ],
                );
              } else {
                return CartFoodListItem(
                  userId: userId,
                  orderItem: state.orders[index],
                );
              }
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 10,
              );
            },
          );
        } else if (state is OrdersLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else {
          return const Center(
            child: Text('что-то не работает'),
          );
        }
      },
    );
  }
}
