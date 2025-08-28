sealed class LoginEvents {}

final class LoginRequest extends LoginEvents {
  final String email, password;

  LoginRequest({required this.email, required this.password});
}
