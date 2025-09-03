class ProfileModel {
  final int id, recipesCount, followingCount, followerCount;
  final String username, firstName, lastName;
  final String? presentation, profilePhoto;

  ProfileModel({
    required this.id,
    required this.recipesCount,
    required this.followingCount,
    required this.followerCount,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.presentation,
    required this.profilePhoto,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'],
      recipesCount: json['recipesCount'],
      followingCount: json['followingCount'],
      followerCount: json['followerCount'],
      username: json['username'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      presentation: json['presentation'],
      profilePhoto: json['profilePhoto'],
    );
  }
}
