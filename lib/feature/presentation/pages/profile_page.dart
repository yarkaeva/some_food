import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:some_food/core/domain/entity/user.dart';
import 'package:some_food/core/theme.dart';
import 'package:some_food/feature/presentation/auth/cubit/auth_cubit.dart';
import 'package:some_food/feature/presentation/blocs/cubits/user_role.dart';
import 'package:some_food/feature/presentation/blocs/main_screen/main_screen_bloc.dart';

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
          onPressed: (index) {
            final userRoleCubit = context.read<UserRoleCubit>();
            final mainScreenBloc = context.read<MainScreenBloc>();
            if (index == 0) {
              userRoleCubit.becomeCustomer();
              mainScreenBloc.add(UserIsCustomerPressed(id: user.id));
            } else if (index == 1) {
              userRoleCubit.becomePerformer();
              mainScreenBloc.add(UserIsPerformerPressed(id: user.id));
            }
          },
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
          'ул. ${user.address}',
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
    final authCubit = context.read<AuthCubit>();
    final mainScreenBloc = context.read<MainScreenBloc>();
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            authCubit.logout();
          },
          child: const Text('ВЫЙТИ'),
        ),
        OutlinedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                title: Text(
                  'Удалить профиль?',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: mainGreen),
                ),
                content: const Text(
                    'Вы уверены, что хотите удалить профиль? Данное действие нельзя отменить.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      mainScreenBloc.add(DeleteProfilePressed(id: user.id));
                      authCubit.logout();
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
          style: Theme.of(context).outlinedButtonTheme.style?.copyWith(
                foregroundColor: const MaterialStatePropertyAll(
                  Color.fromRGBO(211, 123, 123, 1),
                ),
                side: const MaterialStatePropertyAll(
                  BorderSide(
                    color: Color.fromRGBO(211, 123, 123, 1),
                    width: 2,
                  ),
                ),
              ),
          child: const Text('УДАЛИТЬ ПРОФИЛЬ'),
        ),
      ],
    );
  }
}
