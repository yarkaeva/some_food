import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: AlignmentDirectional.center, children: [
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/background_image.png'),
          ),
        ),
      ),
      Positioned(
        bottom: 70,
        child: Row(
          children: [
            OutlinedButton(
              onPressed: () {
                context.go('/login_page');
              },
              style: Theme.of(context).outlinedButtonTheme.style?.copyWith(
                    minimumSize: const MaterialStatePropertyAll(
                      Size(185, 52),
                    ),
                  ),
              child: const Text('ВХОД'),
            ),
            const SizedBox(
              width: 10,
            ),
            ElevatedButton(
              onPressed: () {
                context.go('/register_page');
              },
              style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                    minimumSize: const MaterialStatePropertyAll(
                      Size(185, 52),
                    ),
                  ),
              child: const Text('РЕГИСТРАЦИЯ'),
            ),
          ],
        ),
      )
    ]);
  }
}
