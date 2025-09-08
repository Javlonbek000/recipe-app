import 'package:equatable/equatable.dart';
import 'package:recipe_app/data/models/profile_model.dart';

enum ProfileStatus { loading, success, error }

class ProfileState extends Equatable {
  final ProfileModel? profile;
  final ProfileStatus status;
  final String? errorMessage;

  const ProfileState({
    required this.profile,
    required this.status,
    required this.errorMessage,
  });

  factory ProfileState.initial() {
    return ProfileState(
      profile: null,
      status: ProfileStatus.loading,
      errorMessage: null,
    );
  }

  ProfileState copyWidth({
    ProfileModel? profile,
    ProfileStatus? status,
    String? errorMessage,
  }) {
    return ProfileState(
      profile: profile ?? this.profile,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [profile, status, errorMessage];
}
