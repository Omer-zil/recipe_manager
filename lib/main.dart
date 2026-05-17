import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/recipe_bloc.dart';
import 'services/recipe_service.dart';

import 'screens/splash_screen.dart';

import 'theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RecipeBloc(RecipeService()),

      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        theme: AppTheme.darkTheme,

        home: const SplashScreen(),
      ),
    );
  }
}
