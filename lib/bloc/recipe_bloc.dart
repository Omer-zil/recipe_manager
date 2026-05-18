import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/recipe_model.dart';
import '../services/recipe_service.dart';

import 'recipe_event.dart';
import 'recipe_state.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  final RecipeService recipeService;

  List<Recipe> allRecipes = [];
  List<Recipe> filteredRecipes = [];

  RecipeBloc(this.recipeService) : super(RecipeInitial()) {
    on<FetchRecipes>(_fetchRecipes);
    on<AddRecipe>(_addRecipe);
    on<DeleteRecipe>(_deleteRecipe);
    on<UpdateRecipe>(_updateRecipe);
    on<ToggleFavorite>(_toggleFavorite);
    on<SearchRecipe>(_searchRecipe);
    on<FilterCategory>(_filterCategory); // <-- Added category filtering
  }

  Future<void> _fetchRecipes(
    FetchRecipes event,
    Emitter<RecipeState> emit,
  ) async {
    emit(RecipeLoading());

    try {
      allRecipes = await recipeService.fetchRecipes();

      filteredRecipes = allRecipes;

      emit(RecipeLoaded(filteredRecipes));
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

  void _searchRecipe(SearchRecipe event, Emitter<RecipeState> emit) {
    if (event.query.isEmpty) {
      filteredRecipes = allRecipes;
    } else {
      filteredRecipes = allRecipes.where((recipe) {
        return recipe.title.toLowerCase().contains(event.query.toLowerCase());
      }).toList();
    }

    emit(RecipeLoaded(List.from(filteredRecipes)));
  }

  void _toggleFavorite(ToggleFavorite event, Emitter<RecipeState> emit) {
    final index = allRecipes.indexWhere((recipe) => recipe.id == event.id);

    if (index != -1) {
      allRecipes[index].isFavorite = !allRecipes[index].isFavorite;

      emit(RecipeLoaded(List.from(allRecipes)));
    }
  }

  // ========================
  // CATEGORY FILTER
  // ========================
  void _filterCategory(FilterCategory event, Emitter<RecipeState> emit) {
    if (event.category == 'All') {
      filteredRecipes = allRecipes;
    } else {
      filteredRecipes = allRecipes.where((recipe) {
        return recipe.category.toLowerCase().contains(
          event.category.toLowerCase(),
        );
      }).toList();
    }

    emit(RecipeLoaded(List.from(filteredRecipes)));
  }
}
