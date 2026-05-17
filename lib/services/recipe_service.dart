import 'package:dio/dio.dart';

import '../models/recipe_model.dart';

class RecipeService {
  final Dio dio = Dio();

  final String url = 'https://www.themealdb.com/api/json/v1/1/search.php?s=';

  Future<List<Recipe>> fetchRecipes() async {
    try {
      final response = await dio.get(url);

      final List meals = response.data['meals'];

      return meals.map((json) => Recipe.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load recipes');
    }
  }
}
