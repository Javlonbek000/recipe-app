import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/data/repositories/recipe_repository.dart';
import 'package:recipe_app/features/trending_recipe/manager/trending_recipe_state.dart';

part 'trending_recipe_events.dart';

class TrendingRecipeBloc
    extends Bloc<TrendingRecipeEvent, TrendingRecipeState> {
  final RecipeRepository _recipeRepo;

  TrendingRecipeBloc({required RecipeRepository recipeRepo})
    : _recipeRepo = recipeRepo,
      super(TrendingRecipeState.initial()) {
    on<TrendingRecipeLoad>(_onRecipeLoad);
    add(TrendingRecipeLoad());
  }

  Future<void> _onRecipeLoad(
    TrendingRecipeLoad event,
    Emitter<TrendingRecipeState> emit,
  ) async {
    try {
      final trend = await _recipeRepo.fetchTrendingRecipe();
      final recipes = await _recipeRepo.fetchTrendingRecipes();
      emit(
        state.copyWith(
          trend: trend,
          trendingRecipes: recipes,
          status: TrendingRecipeStatus.success,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: TrendingRecipeStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
