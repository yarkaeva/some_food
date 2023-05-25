import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:some_food/core/domain/entity/order.dart';
import 'package:some_food/feature/presentation/blocs/cubits/amount_counter_cubit.dart';
import 'package:some_food/feature/presentation/blocs/cubits/price_counter.dart';
import 'package:some_food/feature/presentation/blocs/orders/orders_bloc.dart';

class TakeOrderWidget extends StatelessWidget {
  const TakeOrderWidget(
      {super.key, required this.orderItem, required this.userId});
  final OrderEntity orderItem;
  final String userId;

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
      child: Builder(builder: (context) {
        return Column(
          children: [
            CircleAvatar(
              radius: 80,
              backgroundColor: Colors.grey.shade100,
              backgroundImage: NetworkImage(orderItem.dish.url),
            ),
            divider,
            Text(
              orderItem.dish.title,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              orderItem.dish.description,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            divider,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(68, 123, 114, 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    'x ${orderItem.amount} порций',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                const SizedBox(width: 6),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(68, 123, 114, 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    'за 60 мин',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  '${orderItem.price} руб.',
                  style: Theme.of(context).textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
            divider,
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('ВЗЯТЬ ЗАКАЗ'),
            ),
          ],
        );
      }),
    );
  }
}
