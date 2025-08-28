import 'package:recipe_app/core/client.dart';
import 'package:recipe_app/data/models/onboarding_model.dart';

class OnboardingRepository {
  final ApiClient client;

  OnboardingRepository({required this.client});

  Future<List<OnboardingModel>> getOnboardings() async {
    final rawOnboardings = await client.genericGetRequest<List<dynamic>>(
      "/onboarding/list",
    );
    return rawOnboardings.map((e) => OnboardingModel.fromJson(e)).toList();
  }
}
