import 'package:recipe_app/core/client.dart';
import 'package:recipe_app/core/secure_storage.dart';

class AuthRepository {
  final ApiClient client;

  AuthRepository({required this.client});

  String? jwt;

  Future<bool> login({required String email, required String password}) async {
    try {
      final token = await client.login(email, password);
      await SecureStorage.deleteCredentials();
      await SecureStorage.deleteToken();
      await SecureStorage.saveCredentials(login: email, password: password);
      await SecureStorage.saveToken(token: token);
      jwt = token;
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> logout() async {
    await SecureStorage.deleteToken();
    await SecureStorage.deleteCredentials();
  }

  Future<bool> refreshToken() async {
    var credentials = await SecureStorage.getCredentials();
    if (credentials["login"] == null || credentials["password"] == null) {
      return false;
    }
    jwt = await client.login(credentials['login'], credentials['password']);
    await SecureStorage.deleteToken();
    await SecureStorage.saveToken(token: jwt!);
    return true;
  }
}
