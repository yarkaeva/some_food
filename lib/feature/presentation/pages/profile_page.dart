import 'package:flutter/material.dart';
import 'package:some_food/core/domain/entity/user.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.user});
  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Профиль',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _UserRoleWidget(user: user),
            const SizedBox(
              height: 20,
            ),
            _InfoWidget(user: user),
            const SizedBox(
              height: 20,
            ),
            _ActionButtonsWidget(user: user),
          ],
        ),
      ),
    );
  }
}

class _UserRoleWidget extends StatelessWidget {
  const _UserRoleWidget({required this.user});
  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
        ),
        Text(
          user.name,
          style: Theme.of(context).textTheme.bodyMedium,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        const SizedBox(
          height: 20,
        ),
        ToggleButtons(
          isSelected:
              user.role == Role.customer ? [true, false] : [false, true],
          onPressed: (index) {},
          children: const [
            Text('ЗАКАЗЫВАЮ'),
            Text(
              'ГОТОВЛЮ',
            ),
          ],
        ),
      ],
    );
  }
}

class _InfoWidget extends StatelessWidget {
  const _InfoWidget({required this.user});
  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Адрес',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Text(
          user.address,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'e-mail',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Text(
          user.email,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}

class _ActionButtonsWidget extends StatelessWidget {
  const _ActionButtonsWidget({required this.user});
  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {},
          child: const Text('ВЫЙТИ'),
        ),
        OutlinedButton(
          onPressed: () {},
          child: const Text('УДАЛИТЬ ПРОФИЛЬ'),
        ),
      ],
    );
  }
}
