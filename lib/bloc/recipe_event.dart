import '../models/recipe_model.dart';

abstract class RecipeEvent {}

class FetchRecipes extends RecipeEvent {}

class AddRecipe extends RecipeEvent {
  final Recipe recipe;

  AddRecipe(this.recipe);
}
