import 'package:equatable/equatable.dart';

enum LoginStatus { idle, loading, success, error }

class LoginState extends Equatable {
  final LoginStatus status;
  final String? errorMessage;

  const LoginState({required this.status, required this.errorMessage});

  factory LoginState.initial() {
    return LoginState(status: LoginStatus.idle, errorMessage: null);
  }

  LoginState copyWith({String? errorMessage, LoginStatus? status}) {
    return LoginState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage];
}
