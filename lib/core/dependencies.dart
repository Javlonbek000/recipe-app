import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:recipe_app/core/client.dart';
import 'package:recipe_app/data/repositories/auth_repository.dart';
import 'package:recipe_app/data/repositories/category_repository.dart';
import 'package:recipe_app/data/repositories/chef_repository.dart';
import 'package:recipe_app/data/repositories/profile_repository.dart';
import 'package:recipe_app/data/repositories/recipe_repository.dart';

List<SingleChildWidget> providers = [
  Provider(create: (context) => ApiClient()),
  Provider(create: (context) => AuthRepository(client: context.read())),
  Provider(create: (context) => RecipeRepository(client: context.read())),
  Provider(create: (context) => ChefRepository(client: context.read())),
  Provider(create: (context) => ProfileRepository(client: context.read())),
  Provider(create: (context) => CategoryRepository(client: context.read())),
];
