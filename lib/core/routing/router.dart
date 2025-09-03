import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/features/auth/managers/login/login_bloc.dart';
import 'package:recipe_app/features/auth/pages/sign_up/sign_up_view.dart';
import 'package:recipe_app/features/auth/pages/splash.dart';
import 'package:recipe_app/features/categories/manager/categories_bloc.dart';
import 'package:recipe_app/features/categories/pages/categories_view.dart';
import 'package:recipe_app/features/home/manager/home_bloc.dart';
import 'package:recipe_app/features/home/pages/home_view.dart';

import '../../features/auth/pages/login/login_view.dart';

final router = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    GoRoute(path: Routes.splash, builder: (context, state) => Splash()),
    GoRoute(
      path: Routes.login,
      builder: (context, state) => BlocProvider(
        create: (context) => LoginBloc(repo: context.read()),
        child: LoginView(),
      ),
    ),
    GoRoute(path: Routes.signUp, builder: (context, state) => SignUpView()),
    GoRoute(
      path: Routes.home,
      builder: (context, state) => BlocProvider(
        create: (context) => HomeBloc(
          recipeRepo: context.read(),
          chefRepo: context.read(),
          profileRepo: context.read(),
        ),
        child: HomeView(),
      ),
    ),
    GoRoute(
      path: Routes.categories,
      builder: (context, state) => BlocProvider(
        create: (context) => CategoriesBloc(cateRepo: context.read()),
        child: CategoriesView(),
      ),
    ),
  ],
);
