import '../models/recipe_model.dart';

abstract class RecipeEvent {}

class FetchRecipes extends RecipeEvent {}

class AddRecipe extends RecipeEvent {
  final Recipe recipe;

  AddRecipe(this.recipe);
}

class DeleteRecipe extends RecipeEvent {
  final String id;

  DeleteRecipe(this.id);
}

class UpdateRecipe extends RecipeEvent {
  final Recipe recipe;

  UpdateRecipe(this.recipe);
}
