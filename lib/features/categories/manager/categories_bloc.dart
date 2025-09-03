import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/data/repositories/category_repository.dart';
import 'package:recipe_app/features/categories/manager/categories_events.dart';
import 'package:recipe_app/features/categories/manager/categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvents, CategoriesState> {
  final CategoryRepository _cateRepo;

  CategoriesBloc({required CategoryRepository cateRepo})
    : _cateRepo = cateRepo,
      super(CategoriesState.initial()) {
    on<CategoriesLoad>(_onCategoriesLoad);
    add(CategoriesLoad());
  }

  Future<void> _onCategoriesLoad(
    CategoriesLoad event,
    Emitter<CategoriesState> emit,
  ) async {
    try {
      final categories = await _cateRepo.fetchCategories();
      final mainCat = categories.firstWhere((element) => element.main == true);

      emit(
        state.copyWith(
          status: CategoriesStatus.success,
          categories: categories,
          main: mainCat,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
          status: CategoriesStatus.error,
        ),
      );
    }
  }
}
