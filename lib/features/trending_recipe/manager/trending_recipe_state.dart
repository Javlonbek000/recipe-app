import 'package:equatable/equatable.dart';
import 'package:recipe_app/data/models/trending_recipe_model.dart';

enum TrendingRecipeStatus { loading, success, error }

class TrendingRecipeState extends Equatable {
  final TrendingRecipeModel? trend;
  final List<TrendingRecipeModel> trendingRecipes;
  final TrendingRecipeStatus status;
  final String? errorMessage;

  const TrendingRecipeState({
    required this.trend,
    required this.trendingRecipes,
    required this.status,
    required this.errorMessage,
  });

  factory TrendingRecipeState.initial() {
    return TrendingRecipeState(
      trend: null,
      trendingRecipes: [],
      status: TrendingRecipeStatus.loading,
      errorMessage: null,
    );
  }

  TrendingRecipeState copyWith({
    TrendingRecipeModel? trend,
    List<TrendingRecipeModel>? trendingRecipes,
    TrendingRecipeStatus? status,
    String? errorMessage,
  }) {
    return TrendingRecipeState(
      trend: trend ?? this.trend,
      trendingRecipes: trendingRecipes ?? this.trendingRecipes,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [trend, trendingRecipes, status, errorMessage];
}
