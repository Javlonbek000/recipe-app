import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static final _storage = FlutterSecureStorage();

  static final _loginKey = "login",
      _passwordKey = "password",
      _tokenKey = "token";

  static const _firstTimeKey = "first_time";

  static Future<void> saveCredentials({
    required String login,
    required String password,
  }) async {
    await _storage.write(key: _loginKey, value: login);
    await _storage.write(key: _passwordKey, value: password);
  }

  static Future saveToken({required String token}) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  static Future deleteCredentials() async {
    await _storage.delete(key: _loginKey);
    await _storage.delete(key: _passwordKey);
  }

  static Future deleteToken() async {
    await _storage.delete(key: _tokenKey);
  }

  static Future<Map<String, dynamic>> getCredentials() async {
    var credentials = {
      "login": await _storage.read(key: _loginKey),
      "password": await _storage.read(key: _passwordKey),
    };
    return credentials;
  }

  static Future<String?> getToken() async {
    final String? token = await _storage.read(key: _tokenKey);
    return token;
  }

  static Future<void> setFirstTime(bool isFirst) async {
    await _storage.write(key: _firstTimeKey, value: isFirst.toString());
  }

  static Future<bool> isFirstTime() async {
    final value = await _storage.read(key: _firstTimeKey);
    return value == null || value == "true";
  }
}
