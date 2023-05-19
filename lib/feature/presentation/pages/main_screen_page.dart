import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:some_food/core/data/repositories/dish_repository.dart';
import 'package:some_food/core/data/repositories/order_repository.dart';
import 'package:some_food/core/data/repositories/user_repository.dart';
import 'package:some_food/feature/presentation/auth/cubit/auth_cubit.dart';
import 'package:some_food/feature/presentation/blocs/cubits/user_role.dart';
import 'package:some_food/feature/presentation/blocs/main_screen/main_screen_bloc.dart';
import 'package:some_food/feature/presentation/blocs/orders/orders_bloc.dart';
import 'package:some_food/feature/presentation/pages/favorite_page.dart';
import 'package:some_food/feature/presentation/pages/home_page.dart';
import 'package:some_food/feature/presentation/pages/cart_page.dart';
import 'package:some_food/feature/presentation/pages/profile_page.dart';

class MainScreenPage extends StatelessWidget {
  const MainScreenPage({super.key, required this.userId});
  final String userId;

  @override
  Widget build(BuildContext context) {
    final userRepo = UserRepositoryImpl();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MainScreenBloc(
            userRepository: userRepo,
            dishRepository: DishRepositoryImpl(),
            ordersRepository: OrderRepositoryImpl(),
          )..add(HomePressed(id: userId)),
        ),
        BlocProvider(
          create: (context) =>
              UserRoleCubit(userRepository: userRepo)..getRole(userId),
        ),
      ],
      child: MainScreenPageWidget(
        id: userId,
      ),
    );
  }
}

class MainScreenPageWidget extends StatefulWidget {
  const MainScreenPageWidget({
    super.key,
    required this.id,
  });
  final String id;
  @override
  State<MainScreenPageWidget> createState() => _MainScreenPageWidgetState();
}

class _MainScreenPageWidgetState extends State<MainScreenPageWidget> {
  int _currentIndex = 0;

  int _currentIndexPerformer = 2;

  void _onNavigationTapCustomer(int index) {
    final mainScreenBloc = context.read<MainScreenBloc>();
    final ordersBloc = context.read<OrdersBloc>();

    if (_currentIndex == index) return;
    setState(() {
      _currentIndex = index;
    });

    switch (_currentIndex = index) {
      case 0:
        mainScreenBloc.add(
          HomePressed(id: widget.id),
        );
        break;
      case 1:
        mainScreenBloc.add(
          FavoritePressed(id: widget.id),
        );
        break;
      case 2:
        mainScreenBloc.add(
          CartPressed(id: widget.id),
        );
        ordersBloc.add(FirstLoad());
        break;
      case 3:
        mainScreenBloc.add(
          ProfilePressed(id: widget.id),
        );
        break;
      default:
    }
  }

  void _onNavigationTapPerformer(int index) {
    final mainScreenBloc = context.read<MainScreenBloc>();

    if (_currentIndexPerformer == index) return;
    setState(() {
      _currentIndexPerformer = index;
    });

    switch (_currentIndexPerformer = index) {
      case 0:
        mainScreenBloc.add(
          HomePressed(id: widget.id),
        );
        break;
      case 1:
        mainScreenBloc.add(
          CartPressed(id: widget.id),
        );
        break;
      case 2:
        mainScreenBloc.add(
          ProfilePressed(id: widget.id),
        );
        break;

      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LogedOut) {
          context.go('/');
        }
      },
      child: BlocBuilder<UserRoleCubit, RoleState>(
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state == RoleState.customer
                  ? _currentIndex
                  : _currentIndexPerformer,
              items: state == RoleState.customer
                  ? const [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.home_outlined), label: 'home'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.favorite_border_rounded),
                          label: 'favorite'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.shopping_cart_outlined),
                          label: 'cart'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.person_outlined), label: 'cart'),
                    ]
                  : const [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.home_outlined), label: 'home'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.shopping_cart_outlined),
                          label: 'cart'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.person_outlined), label: 'cart'),
                    ],
              onTap: state == RoleState.customer
                  ? _onNavigationTapCustomer
                  : _onNavigationTapPerformer,
            ),
            body: BlocBuilder<MainScreenBloc, MainScreenState>(
              builder: (context, state) {
                if (state is HomeSelected) {
                  return HomePage(
                    user: state.user,
                    list: state.list,
                  );
                } else if (state is FavoriteSelected) {
                  return FavoritePage(user: state.user);
                } else if (state is CartSelected) {
                  return CartPage(user: state.user);
                } else if (state is ProfileSelected) {
                  return ProfilePage(user: state.user);
                } else if (state is Loadig) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else {
                  return const Center(
                    child: Text('что-то не работает'),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
