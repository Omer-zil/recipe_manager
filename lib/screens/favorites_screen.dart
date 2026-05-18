import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/recipe_bloc.dart';
import '../bloc/recipe_state.dart';

import '../theme/app_theme.dart';
import 'recipe_detail_screen.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.darkColor,

      appBar: AppBar(title: const Text('Favorite Recipes')),

      body: BlocBuilder<RecipeBloc, RecipeState>(
        builder: (context, state) {
          if (state is RecipeLoaded) {
            final favorites = state.recipes
                .where((recipe) => recipe.isFavorite)
                .toList();

            if (favorites.isEmpty) {
              return const Center(
                child: Text(
                  'No Favorite Recipes',

                  style: TextStyle(color: Colors.white),
                ),
              );
            }

            return ListView.builder(
              itemCount: favorites.length,

              itemBuilder: (context, index) {
                final recipe = favorites[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => RecipeDetailScreen(recipe: recipe),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(16),

                    decoration: BoxDecoration(
                      color: Colors.white10,

                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),

                          child: Image.network(
                            recipe.imageUrl,

                            height: 220,

                            width: double.infinity,

                            fit: BoxFit.cover,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(16),

                          child: Text(
                            recipe.title,

                            style: const TextStyle(
                              color: Colors.white,

                              fontSize: 22,

                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
