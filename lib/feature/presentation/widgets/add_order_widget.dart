import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:some_food/core/domain/entity/dish.dart';
import 'package:some_food/feature/presentation/cubit/amount_counter_cubit.dart';
import 'package:some_food/feature/presentation/cubit/price_counter.dart';

class AddOrderWidget extends StatelessWidget {
  const AddOrderWidget({super.key, required this.dishItem});
  final DishEntity dishItem;

  @override
  Widget build(BuildContext context) {
    const divider = SizedBox(height: 30);

    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 40,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
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
            children: [
              BlocProvider(
                create: (context) => AmountCounterCubit(),
                child: const _AmountPicker(),
              ),
              BlocProvider(
                create: (context) => PriceCounterCubit(),
                child: const _PricePicker(),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('ДОБАВИТЬ ЗАКАЗ'),
          ),
        ],
      ),
    );
  }
}

class _AmountPicker extends StatelessWidget {
  const _AmountPicker({
    super.key,
  });

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
  const _PricePicker({
    super.key,
  });

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
