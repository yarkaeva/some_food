import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:some_food/feature/presentation/auth/pages/register_details_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Регистрация',
              style:
                  Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 35),
            ),
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Почта',
              ),
              inputFormatters: [
                FilteringTextInputFormatter.deny(' '),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Пароль',
              ),
              obscureText: true,
              inputFormatters: [
                FilteringTextInputFormatter.deny(' '),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                context.go(
                  '/register_page/details',
                  extra: {
                    emailController.text: passwordController.text,
                  },
                );
              },
              style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                    padding: const MaterialStatePropertyAll(
                      EdgeInsets.symmetric(vertical: 19),
                    ),
                  ),
              child: const Text('ДАЛЕЕ'),
            ),
          ],
        ),
      ),
    );
  }
}
