import 'package:flutter/material.dart';
import 'package:some_food/feature/presentation/pages/home_page.dart';
import 'package:some_food/feature/presentation/pages/profile_page.dart';

class BottomBarPage extends StatefulWidget {
  const BottomBarPage({super.key});

  @override
  State<BottomBarPage> createState() => _BottomBarPage();
}

class _BottomBarPage extends State<BottomBarPage> {
  int _currentIndex = 0;
  void _onNavigationTap(int index) {
    if (_currentIndex == index) return;
    setState(() {
      _currentIndex = index;
    });
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
      body: const ProfilePage(),
    );
  }
}
