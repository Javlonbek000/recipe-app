import 'package:recipe_app/core/client.dart';
import 'package:recipe_app/data/models/category_model.dart';

class CategoryRepository {
  final ApiClient client;

  CategoryRepository({required this.client});

  Future<List<CategoryModel>> fetchCategories() async {
    final rawCategory = await client.genericGetRequest<List<dynamic>>(
      '/categories/list',
    );
    return rawCategory.map((e) => CategoryModel.fromJson(e)).toList();
  }
}
