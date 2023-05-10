import 'package:flutter/material.dart';
import 'package:some_food/core/domain/entity/user.dart';

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
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        itemCount: user.customerList?.length ?? 0,
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
                const _OrdersView(),
              ],
            );
          } else {
            return const _OrdersView();
          }
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 10,
          );
        },
      ),
    );
  }
}

class _OrdersView extends StatelessWidget {
  const _OrdersView({super.key});

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
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Название',
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
                  'x 3',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.cancel,
                  color: Color.fromRGBO(211, 123, 123, 1),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text(
                    '250 руб.',
                    style: Theme.of(context).textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(68, 123, 114, 1),
                        borderRadius: BorderRadius.circular(10)),
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
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Статус заказа:',
                    style: Theme.of(context).textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(239, 171, 7, 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      'Готовится',
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
            ],
          ),
        ],
      ),
    );
  }
}
