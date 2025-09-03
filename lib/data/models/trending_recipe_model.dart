class TrendingRecipeModel {
  final int id, categoryId;
  final String title, photo, description, difficulty;
  final num rating, timeRequired;

  TrendingRecipeModel({
    required this.id,
    required this.categoryId,
    required this.timeRequired,
    required this.title,
    required this.photo,
    required this.description,
    required this.difficulty,
    required this.rating,
  });

  factory TrendingRecipeModel.fromJson(Map<String, dynamic> json) {
    return TrendingRecipeModel(
      id: json['id'],
      categoryId: json['categoryId'],
      timeRequired: json['timeRequired'],
      title: json['title'],
      photo: json['photo'],
      description: json['description'],
      difficulty: json['difficulty'],
      rating: json['rating'],
    );
  }
}
