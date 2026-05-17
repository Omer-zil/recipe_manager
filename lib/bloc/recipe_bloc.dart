import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/recipe_model.dart';
import '../services/recipe_service.dart';

import 'recipe_event.dart';
import 'recipe_state.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  final RecipeService recipeService;

  List<Recipe> allRecipes = [];

  RecipeBloc(this.recipeService) : super(RecipeInitial()) {
    on<FetchRecipes>(_fetchRecipes);

    on<AddRecipe>(_addRecipe);

    on<DeleteRecipe>(_deleteRecipe);

    on<UpdateRecipe>(_updateRecipe);
  }

  Future<void> _fetchRecipes(
    FetchRecipes event,
    Emitter<RecipeState> emit,
  ) async {
    emit(RecipeLoading());

    try {
      allRecipes = await recipeService.fetchRecipes();

      emit(RecipeLoaded(allRecipes));
    } catch (e) {
      emit(RecipeError('Failed to load recipes'));
    }
  }

  void _addRecipe(AddRecipe event, Emitter<RecipeState> emit) {
    allRecipes.insert(0, event.recipe);

    emit(RecipeLoaded(List.from(allRecipes)));
  }

  void _deleteRecipe(DeleteRecipe event, Emitter<RecipeState> emit) {
    allRecipes.removeWhere((recipe) => recipe.id == event.id);

    emit(RecipeLoaded(List.from(allRecipes)));
  }

  void _updateRecipe(UpdateRecipe event, Emitter<RecipeState> emit) {
    final index = allRecipes.indexWhere(
      (recipe) => recipe.id == event.recipe.id,
    );

    if (index != -1) {
      allRecipes[index] = event.recipe;

      emit(RecipeLoaded(List.from(allRecipes)));
    }
  }
}
