import 'package:equatable/equatable.dart';
import 'package:recipe_app/data/models/chef_model.dart';
import 'package:recipe_app/data/models/my_recipe_model.dart';
import 'package:recipe_app/data/models/profile_model.dart';
import 'package:recipe_app/data/models/trending_recipe_model.dart';

enum HomeStatus { loading, success, error }

class HomeState extends Equatable {
  final TrendingRecipeModel? trendingRecipe;
  final ProfileModel? profile;
  final List<MyRecipeModel> myRecipes;
  final List<ChefModel> chefs;
  final HomeStatus status;
  final String? errorMessage;

  const HomeState({
    required this.trendingRecipe,
    required this.myRecipes,
    required this.chefs,
    required this.status,
    required this.errorMessage,
    required this.profile,
  });

  factory HomeState.initial() {
    return HomeState(
      trendingRecipe: null,
      chefs: [],
      myRecipes: [],
      status: HomeStatus.loading,
      errorMessage: null,
      profile: null,
    );
  }

  HomeState copyWidth({
    TrendingRecipeModel? trendingRecipe,
    ProfileModel? profile,
    List<MyRecipeModel>? myRecipes,
    List<ChefModel>? chefs,
    HomeStatus? status,
    String? errorMessage,
  }) {
    return HomeState(
      profile: profile ?? this.profile,
      myRecipes: myRecipes ?? this.myRecipes,
      chefs: chefs ?? this.chefs,
      trendingRecipe: trendingRecipe ?? this.trendingRecipe,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    trendingRecipe,
    status,
    errorMessage,
    myRecipes,
    chefs,
    profile,
  ];
}
