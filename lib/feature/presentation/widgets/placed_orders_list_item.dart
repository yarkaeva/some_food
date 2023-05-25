import 'package:flutter/material.dart';
import 'package:some_food/core/domain/entity/order.dart';
import 'package:some_food/feature/presentation/widgets/take_order_widget.dart';

class PlacedOrdersListItem extends StatelessWidget {
  const PlacedOrdersListItem(
      {super.key, required this.orderItem, required this.userId});
  final OrderEntity orderItem;
  final String userId;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey.shade100,
          backgroundImage: NetworkImage(orderItem.dish.url),
        ),
        const SizedBox(
          width: 10,
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                orderItem.dish.title,
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                orderItem.dish.description,
                style: Theme.of(context).textTheme.bodySmall,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
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
                  const SizedBox(width: 6),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(68, 123, 114, 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      '60 мин',
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
              )
            ],
          ),
        ),
        Column(
          children: [
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) =>
                      TakeOrderWidget(userId: userId, orderItem: orderItem),
                );
              },
              icon: const Icon(Icons.add_shopping_cart),
            ),
          ],
        )
      ],
    );
  }
}
