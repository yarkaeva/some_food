import 'package:go_router/go_router.dart';
import 'package:some_food/core/domain/entity/user.dart';
import 'package:some_food/feature/presentation/auth/pages/auth_page.dart';
import 'package:some_food/feature/presentation/auth/pages/login_page.dart';
import 'package:some_food/feature/presentation/auth/pages/register_page.dart';
import 'package:some_food/feature/presentation/pages/main_screen_page.dart';

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
    GoRoute(
      path: '/main_screen',
      builder: (context, state) {
        final userId = state.extra as String;
        return MainScreenPage(
          userId: userId,
        );
      },
    ),
  ],
);
