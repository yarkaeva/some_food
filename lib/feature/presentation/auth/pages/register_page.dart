import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:some_food/core/domain/entity/user.dart';
import 'package:some_food/feature/presentation/auth/cubit/auth_cubit.dart';
import 'package:some_food/feature/presentation/auth/widgets/validator.dart';
import 'package:uuid/uuid.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userNameController = TextEditingController();
  final addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final uuid = const Uuid();

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          child: BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is LogedIn) {
                context.go('/main_screen', extra: state.id);
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Регистрация',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontSize: 35),
                ),
                const SizedBox(
                  height: 40,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        validator: (value) {
                          final valueWithoutSpaces = value?.replaceAll(' ', '');
                          if (valueWithoutSpaces == null ||
                              valueWithoutSpaces.isEmpty) {
                            return 'Поле не может быть пустым';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: 'Почта',
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(' '),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: passwordController,
                        validator: validatePassword,
                        decoration: const InputDecoration(
                          labelText: 'Пароль',
                        ),
                        obscureText: true,
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(' '),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: userNameController,
                        validator: validateField,
                        decoration: const InputDecoration(
                            labelText: 'Ваше имя',
                            floatingLabelAlignment:
                                FloatingLabelAlignment.start),
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(' '),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: addressController,
                        validator: validateField,
                        decoration: const InputDecoration(
                          labelText: 'Адрес доставки',
                          prefixText: 'ул. ',
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.deny('  '),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }
                    authCubit.register(
                      UserEntity(
                        id: uuid.v1(),
                        email: emailController.text,
                        password: passwordController.text,
                        name: userNameController.text,
                        address: addressController.text.trim(),
                        role: Role.customer,
                      ),
                    );
                  },
                  style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                        padding: const MaterialStatePropertyAll(
                          EdgeInsets.symmetric(vertical: 19),
                        ),
                      ),
                  child: const Text('ЗАРЕГИСТРИРОВАТЬСЯ'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
