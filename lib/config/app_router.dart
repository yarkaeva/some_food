import 'package:go_router/go_router.dart';
import 'package:some_food/feature/presentation/auth/pages/auth_page.dart';
import 'package:some_food/feature/presentation/auth/pages/login_page.dart';
import 'package:some_food/feature/presentation/auth/pages/register_page.dart';

final GoRouter router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (context, state) => const AuthPage(),
      routes: [
        GoRoute(
          path: 'login_page',
          builder: (context, state) => const LogInPage(),
        ),
        GoRoute(
          path: 'register_page',
          builder: (context, state) => const RegisterPage(),
        ),
      ],
    ),
  ],
);
