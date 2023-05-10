import 'package:flutter/material.dart';
import 'package:some_food/core/domain/entity/dish.dart';

class FoodListItem extends StatelessWidget {
  const FoodListItem({super.key, required this.dishItem});
  final DishEntity dishItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey.shade100,
          backgroundImage: NetworkImage(dishItem.url),
        ),
        const SizedBox(
          width: 10,
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                dishItem.title,
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                dishItem.description,
                style: Theme.of(context).textTheme.bodySmall,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ],
          ),
        ),
        Column(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border_outlined),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add_shopping_cart),
            ),
          ],
        )
      ],
    );
  }
}
