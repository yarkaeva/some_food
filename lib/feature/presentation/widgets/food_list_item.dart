import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:some_food/core/domain/entity/dish.dart';
import 'package:some_food/core/theme.dart';
import 'package:some_food/feature/presentation/blocs/main_screen/main_screen_bloc.dart';
import 'package:some_food/feature/presentation/widgets/add_order_widget.dart';

class FoodListItem extends StatelessWidget {
  const FoodListItem({super.key, required this.dishItem, required this.userId});
  final DishEntity dishItem;
  final String userId;

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
              onPressed: () {
                final bloc = context.read<MainScreenBloc>();
                if (bloc.state is HomeSelected) {
                  bloc.add(FavoriteStatusToggledOnHome(
                    id: userId,
                    dishItem: dishItem,
                  ));
                } else if (bloc.state is FavoriteSelected) {
                  bloc.add(FavoriteStatusToggledOnFavorite(
                    id: userId,
                    dishItem: dishItem,
                  ));
                }
              },
              icon: dishItem.isFavorite
                  ? Icon(
                      Icons.favorite,
                      color: mainGreen,
                    )
                  : const Icon(Icons.favorite_border_outlined),
            ),
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => AddOrderWidget(dishItem: dishItem),
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
