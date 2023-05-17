import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:some_food/config/app_router.dart';
import 'package:some_food/core/data/models/dish_model.dart';
import 'package:some_food/core/data/models/order_model.dart';
import 'package:some_food/core/data/models/user_model.dart';
import 'package:some_food/core/data/repositories/dish_repository.dart';
import 'package:some_food/core/data/repositories/order_repository.dart';
import 'package:some_food/core/data/repositories/user_repository.dart';
import 'package:some_food/core/theme.dart';
import 'package:some_food/feature/presentation/auth/cubit/auth_cubit.dart';
import 'package:some_food/feature/presentation/blocs/main_screen/main_screen_bloc.dart';
import 'package:some_food/feature/presentation/blocs/orders/orders_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await hiveInit();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final userRepo = UserRepositoryImpl();
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(
            userRepo,
          ),
        ),
        BlocProvider<MainScreenBloc>(
          create: (context) => MainScreenBloc(
            userRepository: userRepo,
            dishRepository: DishRepositoryImpl(),
          ),
        ),
        BlocProvider<OrdersBloc>(
          create: (context) => OrdersBloc(
            ordersRepo: OrderRepositoryImpl(),
            userRepo: userRepo,
          ),
        ),
      ],
      child: MaterialApp.router(
        theme: CustomTheme.lightTheme,
        routerConfig: router,
      ),
    );
  }
}

Future<void> hiveInit() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(RoleModelAdapter());
  Hive.registerAdapter(OrderModelAdapter());
  Hive.registerAdapter(OrderStatusModelAdapter());
  Hive.registerAdapter(DishModelAdapter());
}
