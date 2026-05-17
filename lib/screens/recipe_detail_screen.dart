import 'package:flutter/material.dart';

import '../models/recipe_model.dart';

import '../theme/app_theme.dart';

class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.darkColor,

      body: CustomScrollView(
        slivers: [
          // APP BAR IMAGE
          SliverAppBar(
            expandedHeight: 320,

            backgroundColor: AppTheme.darkColor,

            pinned: true,

            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(recipe.imageUrl, fit: BoxFit.cover),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  // TITLE
                  Text(
                    recipe.title,

                    style: const TextStyle(
                      color: Colors.white,

                      fontSize: 32,

                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // CATEGORY + AREA
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,

                          vertical: 8,
                        ),

                        decoration: BoxDecoration(
                          color: AppTheme.primaryColor,

                          borderRadius: BorderRadius.circular(14),
                        ),

                        child: Text(
                          recipe.category,

                          style: const TextStyle(color: Colors.white),
                        ),
                      ),

                      const SizedBox(width: 12),

                      Text(
                        recipe.area,

                        style: const TextStyle(
                          color: Colors.white70,

                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // SECTION TITLE
                  const Text(
                    'Instructions',

                    style: TextStyle(
                      color: Colors.white,

                      fontSize: 24,

                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Text(
                    recipe.instructions,

                    style: const TextStyle(
                      color: Colors.white70,

                      height: 1.8,

                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 40),

                  // FAVORITE BUTTON
                  SizedBox(
                    width: double.infinity,

                    height: 60,

                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primaryColor,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),

                      onPressed: () {},

                      icon: const Icon(Icons.favorite, color: Colors.white),

                      label: const Text(
                        'Add To Favorites',

                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
