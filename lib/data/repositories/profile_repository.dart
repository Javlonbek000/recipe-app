import 'package:recipe_app/core/client.dart';
import 'package:recipe_app/data/models/profile_model.dart';

class ProfileRepository {
  final ApiClient client;

  ProfileRepository({required this.client});

  Future<ProfileModel> fetchMe() async {
    final rawProfile = await client.genericGetRequest<Map<String, dynamic>>(
      '/auth/me',
    );
    return ProfileModel.fromJson(rawProfile);
  }
}
