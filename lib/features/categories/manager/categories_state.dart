import 'package:equatable/equatable.dart';
import 'package:recipe_app/data/models/category_model.dart';

enum CategoriesStatus { loading, success, error }

class CategoriesState extends Equatable {
  final List<CategoryModel> categories;
  final CategoryModel? main;
  final CategoriesStatus status;
  final String? errorMessage;

  const CategoriesState({
    required this.categories,
    required this.status,
    required this.main,
    this.errorMessage,
  });

  factory CategoriesState.initial() {
    return CategoriesState(
      categories: [],
      status: CategoriesStatus.loading,
      errorMessage: null,
      main: null,
    );
  }

  CategoriesState copyWith({
    List<CategoryModel>? categories,
    CategoriesStatus? status,
    CategoryModel? main,
    String? errorMessage,
  }) {
    return CategoriesState(
      categories: categories ?? this.categories,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      main: main ?? this.main,
    );
  }

  @override
  List<Object?> get props => [categories, status, errorMessage, main];
}
