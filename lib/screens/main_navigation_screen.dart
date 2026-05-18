import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'favorites_screen.dart';

import '../theme/app_theme.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int currentIndex = 0;

  final screens = [const HomeScreen(), const FavoritesScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,

        backgroundColor: AppTheme.darkColor,

        selectedItemColor: AppTheme.primaryColor,

        unselectedItemColor: Colors.white54,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),

          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),

            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
