import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Профиль',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: const ProfileView(),
    );
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          _UserRoleWidget(),
          SizedBox(
            height: 20,
          ),
          _InfoWidget(),
          SizedBox(
            height: 20,
          ),
          _ActionButtonsWidget(),
        ],
      ),
    );
  }
}

class _UserRoleWidget extends StatelessWidget {
  const _UserRoleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isSelected = [false, true];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
        ),
        Text(
          'Дарина',
          style: Theme.of(context).textTheme.bodyMedium,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        const SizedBox(
          height: 20,
        ),
        ToggleButtons(
          isSelected: isSelected,
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
  const _InfoWidget();

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
          'ул. Герцена 44',
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
          'darina@example.com',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}

class _ActionButtonsWidget extends StatelessWidget {
  const _ActionButtonsWidget({super.key});

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
