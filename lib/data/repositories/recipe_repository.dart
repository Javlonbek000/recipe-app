import 'package:recipe_app/core/client.dart';
import 'package:recipe_app/data/models/my_recipe_model.dart';
import 'package:recipe_app/data/models/trending_recipe_model.dart';

class RecipeRepository {
  final ApiClient client;

  RecipeRepository({required this.client});

  Future<TrendingRecipeModel> fetchTrendingRecipe() async {
    final rawTrendingRecipe = await client.genericGetRequest<Map<String, dynamic>>('/recipes/trending-recipe');
    return TrendingRecipeModel.fromJson(rawTrendingRecipe);
  }

  Future<List<MyRecipeModel>> fetchMyRecipes({int? limit, int? page}) async {
    final rawMyRecipes = await client.genericGetRequest<List<dynamic>>(
      '/recipes/my-recipes',
      queryParams: {"Limit": limit, "Page": page},
    );
    return rawMyRecipes.map((e) => MyRecipeModel.fromJson(e)).toList();
  }
}
