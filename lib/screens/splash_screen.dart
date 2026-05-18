import 'package:flutter/material.dart';
import 'package:recipe_manager/screens/main_navigation_screen.dart';

import '../theme/app_theme.dart';
import 'home_screen.dart';
import 'main_navigation_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,

        children: [
          // BACKGROUND IMAGE
          Image.network(
            'https://images.unsplash.com/photo-1504674900247-0877df9cc836',

            fit: BoxFit.cover,
          ),

          // DARK OVERLAY
          Container(color: Colors.black.withOpacity(0.65)),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  const SizedBox(),

                  // CENTER CONTENT
                  Column(
                    children: [
                      const SizedBox(height: 40),

                      const Text(
                        'CookApp',

                        style: TextStyle(
                          color: Colors.white,

                          fontSize: 42,

                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Container(
                        width: 100,
                        height: 3,

                        decoration: BoxDecoration(
                          color: AppTheme.primaryColor,

                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),

                      const SizedBox(height: 50),

                      Container(
                        height: 120,
                        width: 120,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),

                          image: const DecorationImage(
                            image: NetworkImage(
                              'https://images.unsplash.com/photo-1513104890138-7c749659a591',
                            ),

                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      const SizedBox(height: 40),

                      const Text(
                        'Cooking with Fun!',

                        style: TextStyle(
                          color: Colors.white,

                          fontSize: 30,

                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 15),

                      const Text(
                        'Get millions of beautiful and delicious recipes around the world',

                        textAlign: TextAlign.center,

                        style: TextStyle(
                          color: Colors.white70,

                          fontSize: 16,

                          height: 1.6,
                        ),
                      ),
                    ],
                  ),

                  // BUTTON
                  SizedBox(
                    width: double.infinity,
                    height: 60,

                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primaryColor,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),

                      onPressed: () {
                        Navigator.pushReplacement(
                          context,

                          MaterialPageRoute(
                            builder: (_) => const MainNavigationScreen(),
                          ),
                        );
                      },

                      child: const Text(
                        'Get Started',

                        style: TextStyle(
                          color: Colors.white,

                          fontSize: 18,

                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
