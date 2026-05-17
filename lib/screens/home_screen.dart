import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/recipe_bloc.dart';
import '../bloc/recipe_event.dart';
import '../bloc/recipe_state.dart';

import '../theme/app_theme.dart';

import 'recipe_detail_screen.dart';
import 'add_recipe_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    context.read<RecipeBloc>().add(FetchRecipes());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.darkColor,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              // HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: const [
                      Text(
                        'Welcome Back 👋',

                        style: TextStyle(color: Colors.white70, fontSize: 18),
                      ),

                      SizedBox(height: 8),

                      Text(
                        'Find Best Recipes',

                        style: TextStyle(
                          color: Colors.white,

                          fontSize: 32,

                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const CircleAvatar(
                    radius: 26,

                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // SEARCH BAR
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),

                decoration: BoxDecoration(
                  color: Colors.white10,

                  borderRadius: BorderRadius.circular(18),
                ),

                child: const TextField(
                  style: TextStyle(color: Colors.white),

                  decoration: InputDecoration(
                    border: InputBorder.none,

                    hintText: 'Search recipes',

                    hintStyle: TextStyle(color: Colors.white54),

                    icon: Icon(Icons.search, color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // CATEGORY CHIPS
              SizedBox(
                height: 45,

                child: ListView(
                  scrollDirection: Axis.horizontal,

                  children: [
                    categoryChip('All', true),

                    categoryChip('Pizza', false),

                    categoryChip('Burger', false),

                    categoryChip('Dessert', false),

                    categoryChip('Drinks', false),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                'Popular Recipes',

                style: TextStyle(
                  color: Colors.white,

                  fontSize: 24,

                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              // RECIPES
              Expanded(
                child: BlocBuilder<RecipeBloc, RecipeState>(
                  builder: (context, state) {
                    if (state is RecipeLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppTheme.primaryColor,
                        ),
                      );
                    }

                    if (state is RecipeError) {
                      return Center(
                        child: Text(
                          state.message,

                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    }

                    if (state is RecipeLoaded) {
                      return ListView.builder(
                        itemCount: state.recipes.length,

                        itemBuilder: (context, index) {
                          final recipe = state.recipes[index];

                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,

                                MaterialPageRoute(
                                  builder: (_) =>
                                      RecipeDetailScreen(recipe: recipe),
                                ),
                              );
                            },

                            child: Container(
                              margin: const EdgeInsets.only(bottom: 24),

                              decoration: BoxDecoration(
                                color: Colors.white10,

                                borderRadius: BorderRadius.circular(25),
                              ),

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  // IMAGE
                                  Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            const BorderRadius.vertical(
                                              top: Radius.circular(25),
                                            ),

                                        child: Image.network(
                                          recipe.imageUrl,

                                          height: 240,

                                          width: double.infinity,

                                          fit: BoxFit.cover,

                                          errorBuilder:
                                              (context, error, stackTrace) {
                                                return Container(
                                                  height: 240,

                                                  color: Colors.grey,

                                                  child: const Center(
                                                    child: Icon(
                                                      Icons.restaurant,
                                                      color: Colors.white,
                                                      size: 50,
                                                    ),
                                                  ),
                                                );
                                              },
                                        ),
                                      ),

                                      Positioned(
                                        top: 15,

                                        right: 15,

                                        child: Container(
                                          padding: const EdgeInsets.all(10),

                                          decoration: BoxDecoration(
                                            color: Colors.black54,

                                            borderRadius: BorderRadius.circular(
                                              14,
                                            ),
                                          ),

                                          child: const Icon(
                                            Icons.favorite_border,

                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.all(18),

                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,

                                      children: [
                                        Text(
                                          recipe.title,

                                          style: const TextStyle(
                                            color: Colors.white,

                                            fontSize: 24,

                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),

                                        const SizedBox(height: 12),

                                        Row(
                                          children: [
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 14,

                                                    vertical: 8,
                                                  ),

                                              decoration: BoxDecoration(
                                                color: AppTheme.primaryColor,

                                                borderRadius:
                                                    BorderRadius.circular(14),
                                              ),

                                              child: Text(
                                                recipe.category,

                                                style: const TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),

                                            const SizedBox(width: 12),

                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.location_on,

                                                  color: Colors.white70,

                                                  size: 18,
                                                ),

                                                const SizedBox(width: 4),

                                                Text(
                                                  recipe.area,

                                                  style: const TextStyle(
                                                    color: Colors.white70,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),

                                        const SizedBox(height: 16),

                                        Text(
                                          recipe.instructions.length > 120
                                              ? '${recipe.instructions.substring(0, 120)}...'
                                              : recipe.instructions,

                                          style: const TextStyle(
                                            color: Colors.white60,

                                            height: 1.5,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }

                    return const SizedBox();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppTheme.primaryColor,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddRecipeScreen()),
          );
        },
      ),
    );
  }

  Widget categoryChip(String title, bool selected) {
    return Container(
      margin: const EdgeInsets.only(right: 12),

      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),

      decoration: BoxDecoration(
        color: selected ? AppTheme.primaryColor : Colors.white10,

        borderRadius: BorderRadius.circular(16),
      ),

      child: Text(
        title,

        style: TextStyle(
          color: selected ? Colors.white : Colors.white70,

          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
