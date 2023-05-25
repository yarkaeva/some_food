import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:some_food/core/domain/entity/order.dart';
import 'package:some_food/core/theme.dart';
import 'package:some_food/feature/presentation/blocs/orders/orders_bloc.dart';

class PerformerOrdersListItem extends StatelessWidget {
  const PerformerOrdersListItem({
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
            color: const Color.fromRGBO(68, 123, 114, 1),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _TitleAndAmount(orderItem: orderItem, userId: userId),
          _OrderStatus(status: orderItem.status),
          const SizedBox(height: 10),
          _OrderActions(
              orderId: orderItem.id, userId: userId, status: orderItem.status),
        ],
      ),
    );
  }
}

class _TitleAndAmount extends StatelessWidget {
  const _TitleAndAmount({
    super.key,
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
        Text(
          orderItem.dish.title,
          style: Theme.of(context).textTheme.bodyMedium,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
          decoration: BoxDecoration(
              color: const Color.fromRGBO(68, 123, 114, 1),
              borderRadius: BorderRadius.circular(10)),
          child: Text(
            'x ${orderItem.amount}',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.white),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                title: Text(
                  'Отменить выполнение заказ?',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: mainGreen),
                ),
                content: const Text(
                    'Вы уверены, что хотите отказаться от выполнения заказа? Данное действие будет нельзя отменить.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      context.read<OrdersBloc>().add(
                            OrderRefused(userId: userId, orderId: orderItem.id),
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

class _OrderStatus extends StatelessWidget {
  const _OrderStatus({
    super.key,
    required this.status,
  });

  final OrderStatus status;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Статус заказа:',
          style: Theme.of(context).textTheme.bodySmall,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        const SizedBox(width: 10),
        Text(
          status == OrderStatus.placed
              ? 'Размещен'
              : status == OrderStatus.inProgress
                  ? 'Готовится'
                  : status == OrderStatus.done
                      ? 'Ждет подтверждения'
                      : 'Завершен',
          style: Theme.of(context).textTheme.bodySmall,
          overflow: TextOverflow.clip,
          maxLines: 1,
        ),
      ],
    );
  }
}

class _OrderActions extends StatelessWidget {
  const _OrderActions({
    super.key,
    required this.orderId,
    required this.userId,
    required this.status,
  });
  final String orderId;
  final String userId;
  final OrderStatus status;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
          decoration: BoxDecoration(
              color: const Color.fromRGBO(68, 123, 114, 1),
              borderRadius: BorderRadius.circular(10)),
          child: Text(
            'Детали заказа',
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Colors.white),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        const SizedBox(width: 10),
        if (status == OrderStatus.inProgress)
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  title: Text(
                    'Готовы завершить заказ?',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: mainGreen),
                  ),
                  content: const Text('Нажмите да, если блюдо готово.'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        context.read<OrdersBloc>().add(
                            OrderFinished(userId: userId, orderId: orderId));
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
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(239, 171, 7, 1),
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                'Завершить',
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
    );
  }
}
