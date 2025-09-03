import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/data/repositories/chef_repository.dart';
import 'package:recipe_app/data/repositories/profile_repository.dart';
import 'package:recipe_app/data/repositories/recipe_repository.dart';
import 'package:recipe_app/features/home/manager/home_events.dart';
import 'package:recipe_app/features/home/manager/home_state.dart';

class HomeBloc extends Bloc<HomeEvents, HomeState> {
  final RecipeRepository _recipeRepo;
  final ChefRepository _chefRepo;
  final ProfileRepository _profileRepo;

  HomeBloc({
    required RecipeRepository recipeRepo,
    required ChefRepository chefRepo,
    required ProfileRepository profileRepo,
  }) : _recipeRepo = recipeRepo,
       _chefRepo = chefRepo,
       _profileRepo = profileRepo,
       super(HomeState.initial()) {
    on<HomeLoad>(_onTrendingRecipe);
    add(HomeLoad());
  }

  Future<void> _onTrendingRecipe(
    HomeLoad event,
    Emitter<HomeState> emit,
  ) async {
    try {
      final trendingRecipe = await _recipeRepo.fetchTrendingRecipe();
      final myRecipes = await _recipeRepo.fetchMyRecipes(limit: 2);
      final chefs = await _chefRepo.fetchChefs(limit: 4);
      final me = await _profileRepo.fetchMe();
      emit(
        state.copyWidth(
          profile: me,
          trendingRecipe: trendingRecipe,
          myRecipes: myRecipes,
          chefs: chefs,
          status: HomeStatus.success,
        ),
      );
    } catch (e) {
      emit(
        state.copyWidth(errorMessage: e.toString(), status: HomeStatus.error),
      );
    }
  }
}
