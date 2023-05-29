import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:some_food/core/domain/entity/order.dart';
import 'package:some_food/core/theme.dart';
import 'package:some_food/feature/presentation/blocs/orders/orders_bloc.dart';

class CustomerOrdersListItem extends StatelessWidget {
  const CustomerOrdersListItem({
    super.key,
    required this.orderItem,
    required this.userId,
  });
  final OrderEntity orderItem;
  final String userId;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23),
          border: Border.all(
            width: 2,
            color: orderItem.status != OrderStatus.closed
                ? const Color.fromRGBO(68, 123, 114, 1)
                : Colors.grey,
          )),
      child: Column(
        children: [
          _TitleAndAmount(orderItem: orderItem, userId: userId),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _PriceAndTime(orderItem: orderItem),
              const SizedBox(width: 10),
              _OrderStatus(
                  status: orderItem.status,
                  orderId: orderItem.id,
                  userId: userId),
            ],
          ),
        ],
      ),
    );
  }
}

class _TitleAndAmount extends StatelessWidget {
  const _TitleAndAmount({
    required this.orderItem,
    required this.userId,
  });

  final OrderEntity orderItem;
  final String userId;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              orderItem.dish.title,
              style: Theme.of(context).textTheme.bodyMedium,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            const SizedBox(width: 10),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(68, 123, 114, 1),
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                'x ${orderItem.amount}',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.white),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        ),
        if (orderItem.status != OrderStatus.closed)
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  title: Text(
                    'Удалить заказ?',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: mainGreen),
                  ),
                  content: const Text(
                      'Вы уверены, что хотите удалить заказ? Данное действие будет нельзя отменить.'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        context.read<OrdersBloc>().add(
                              OrderDeleted(
                                  userId: userId, orderId: orderItem.id),
                            );
                      },
                      child: const Text('Да'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Нет'),
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(
              Icons.cancel,
              color: Color.fromRGBO(211, 123, 123, 1),
            ),
          ),
      ],
    );
  }
}

class _PriceAndTime extends StatelessWidget {
  const _PriceAndTime({
    required this.orderItem,
  });

  final OrderEntity orderItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '${orderItem.price} руб.',
          style: Theme.of(context).textTheme.bodySmall,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(68, 123, 114, 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            '30 мин.',
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Colors.white),
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}

class _OrderStatus extends StatelessWidget {
  const _OrderStatus({
    required this.status,
    required this.orderId,
    required this.userId,
  });

  final OrderStatus status;
  final String orderId;
  final String userId;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Статус заказа:',
          style: Theme.of(context).textTheme.bodySmall,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
              decoration: BoxDecoration(
                  color: status == OrderStatus.inProgress
                      ? const Color.fromRGBO(239, 171, 7, 1)
                      : Colors.grey,
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                status == OrderStatus.placed
                    ? 'Размещен'
                    : status == OrderStatus.inProgress
                        ? 'Готовится'
                        : status == OrderStatus.done
                            ? 'Готов'
                            : 'Завершен',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.white),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            const SizedBox(width: 10),
            if (status == OrderStatus.done)
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      title: Text(
                        'Вы получили заказ?',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: mainGreen),
                      ),
                      content:
                          const Text('Нажмите да, если вы получили заказ.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            context.read<OrdersBloc>().add(
                                OrderClosed(userId: userId, orderId: orderId));
                          },
                          child: const Text('Да'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Нет'),
                        ),
                      ],
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(239, 171, 7, 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    'Подтвердить',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ),
          ],
        )
      ],
    );
  }
}
