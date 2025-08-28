import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/data/repositories/auth_repository.dart';
import 'package:recipe_app/features/auth/managers/login/login_events.dart';
import 'package:recipe_app/features/auth/managers/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvents, LoginState> {
  final AuthRepository _repo;

  LoginBloc({required AuthRepository repo})
    : _repo = repo,
      super(LoginState.initial()) {
    on<LoginRequest>(_onLoginRequest);
  }

  Future<void> _onLoginRequest(
    LoginRequest event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      final result = await _repo.login(
        email: event.email,
        password: event.password,
      );

      if (result) {
        emit(state.copyWith(status: LoginStatus.success));
      } else {
        emit(
          state.copyWith(
            status: LoginStatus.error,
            errorMessage: "Login qilib bolmadi!",
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(status: LoginStatus.error, errorMessage: e.toString()),
      );
    }
  }
}
