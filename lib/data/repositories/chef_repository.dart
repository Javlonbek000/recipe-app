import 'package:recipe_app/core/client.dart';
import 'package:recipe_app/data/models/chef_model.dart';

class ChefRepository {
  final ApiClient client;

  ChefRepository({required this.client});

  Future<List<ChefModel>> fetchChefs({int? page, int? limit}) async {
    final rawChefs = await client.genericGetRequest<List<dynamic>>(
      '/top-chefs/list',
      queryParams: {"Page": page, "Limit": limit},
    );
    return rawChefs.map((e) => ChefModel.fromJson(e)).toList();
  }
}
