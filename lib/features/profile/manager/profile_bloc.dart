import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/data/repositories/profile_repository.dart';
import 'package:recipe_app/features/profile/manager/profile_state.dart';

part 'profile_events.dart';

class ProfileBloc extends Bloc<ProfileEvents, ProfileState> {
  final ProfileRepository _repo;

  ProfileBloc({required ProfileRepository repo})
    : _repo = repo,
      super(ProfileState.initial()) {
    on<ProfileLoad>(_onProfileLoad);
    add(ProfileLoad());
  }

  Future<void> _onProfileLoad(
    ProfileLoad event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      final profile = await _repo.fetchMe();
      emit(state.copyWidth(profile: profile, status: ProfileStatus.success));
    } catch (e) {
      emit(
        state.copyWidth(
          status: ProfileStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
