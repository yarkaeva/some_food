import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:some_food/feature/presentation/bloc/main_screen_bloc.dart';
import 'package:some_food/feature/presentation/pages/favorite_page.dart';
import 'package:some_food/feature/presentation/pages/home_page.dart';
import 'package:some_food/feature/presentation/pages/cart_page.dart';
import 'package:some_food/feature/presentation/pages/profile_page.dart';

class MainScreenPage extends StatefulWidget {
  const MainScreenPage({super.key, required this.id});
  final String id;

  @override
  State<MainScreenPage> createState() => _MainScreenPage();
}

class _MainScreenPage extends State<MainScreenPage> {
  int _currentIndex = 0;

  void _onNavigationTap(int index) {
    final bloc = context.read<MainScreenBloc>();

    if (_currentIndex == index) return;
    setState(() {
      _currentIndex = index;
    });

    switch (_currentIndex = index) {
      case 0:
        bloc.add(
          HomePressed(id: widget.id),
        );
        break;
      case 1:
        bloc.add(
          FavoritePressed(id: widget.id),
        );
        break;
      case 2:
        bloc.add(
          CartPressed(id: widget.id),
        );
        break;
      case 3:
        bloc.add(
          ProfilePressed(id: widget.id),
        );
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_rounded), label: 'favorite'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: 'cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined), label: 'cart'),
        ],
        onTap: _onNavigationTap,
      ),
      body: BlocBuilder<MainScreenBloc, MainScreenState>(
        builder: (context, state) {
          if (state is HomeSelected) {
            return HomePage(user: state.user);
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
  }
}
