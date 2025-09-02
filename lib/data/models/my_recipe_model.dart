class MyRecipeModel {
  final int id, categoryId;
  final String title, description, difficulty;
  final String? photo;
  final num rating, timeRequired;

  MyRecipeModel({
    required this.id,
    required this.categoryId,
    required this.timeRequired,
    required this.title,
    required this.description,
    required this.difficulty,
    required this.photo,
    required this.rating,
  });

  factory MyRecipeModel.fromJson(Map<String, dynamic> json) {
    return MyRecipeModel(
      id: json['id'],
      categoryId: json['categoryId'],
      timeRequired: json['timeRequired'],
      title: json['title'],
      description: json['description'],
      difficulty: json['difficulty'],
      photo: json['photo'],
      rating: json['rating'],
    );
  }
}
