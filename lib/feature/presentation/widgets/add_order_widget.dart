import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:some_food/core/domain/entity/dish.dart';
import 'package:some_food/core/domain/entity/order.dart';
import 'package:some_food/feature/presentation/blocs/cubits/amount_counter_cubit.dart';
import 'package:some_food/feature/presentation/blocs/cubits/price_counter.dart';
import 'package:some_food/feature/presentation/blocs/orders/orders_bloc.dart';
import 'package:uuid/uuid.dart';

class AddOrderWidget extends StatelessWidget {
  const AddOrderWidget(
      {super.key, required this.dishItem, required this.userId});
  final DishEntity dishItem;
  final String userId;
  final uuid = const Uuid();

  @override
  Widget build(BuildContext context) {
    const divider = SizedBox(height: 30);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AmountCounterCubit(),
        ),
        BlocProvider(
          create: (context) => PriceCounterCubit(),
        ),
      ],
      child: Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 40,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Builder(builder: (context) {
          return Column(
            children: [
              CircleAvatar(
                radius: 80,
                backgroundColor: Colors.grey.shade100,
                backgroundImage: NetworkImage(dishItem.url),
              ),
              divider,
              Text(
                dishItem.title,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                dishItem.description,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              divider,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  _AmountPicker(),
                  _PricePicker(),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<OrdersBloc>().add(
                        OrderAdded(
                          userId: userId,
                          order: OrderEntity(
                            dish: dishItem,
                            price: context.read<PriceCounterCubit>().state,
                            cookingTime: 30,
                            amount: context.read<AmountCounterCubit>().state,
                            status: OrderStatus.placed,
                            id: uuid.v1(),
                          ),
                        ),
                      );
                  Navigator.pop(context);
                },
                child: const Text('ДОБАВИТЬ ЗАКАЗ'),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class _AmountPicker extends StatelessWidget {
  const _AmountPicker();

  @override
  Widget build(BuildContext context) {
    final amountCubit = context.read<AmountCounterCubit>();
    return BlocBuilder<AmountCounterCubit, int>(
      builder: (context, state) {
        return Column(
          children: [
            const Text('Количество'),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    amountCubit.decrement();
                  },
                  icon: const Icon(Icons.remove_circle),
                  color: Colors.amber,
                ),
                Text('$state'),
                IconButton(
                  onPressed: () {
                    amountCubit.increment();
                  },
                  icon: const Icon(
                    Icons.add_circle,
                    color: Colors.amber,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class _PricePicker extends StatelessWidget {
  const _PricePicker();

  @override
  Widget build(BuildContext context) {
    final priceCubit = context.read<PriceCounterCubit>();
    return BlocBuilder<PriceCounterCubit, int>(
      builder: (context, state) {
        return Column(
          children: [
            const Text('Цена'),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    priceCubit.decrement();
                  },
                  icon: const Icon(Icons.remove_circle),
                  color: Colors.amber,
                ),
                Text('$state'),
                IconButton(
                  onPressed: () {
                    priceCubit.increment();
                  },
                  icon: const Icon(
                    Icons.add_circle,
                    color: Colors.amber,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
