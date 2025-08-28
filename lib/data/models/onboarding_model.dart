class OnboardingModel {
  final int id, order;
  final String title, subtilte, image;

  OnboardingModel({
    required this.id,
    required this.order,
    required this.title,
    required this.subtilte,
    required this.image,
  });

  factory OnboardingModel.fromJson(Map<String, dynamic> json) {
    return OnboardingModel(
      id: json['id'],
      order: json['order'],
      title: json['title'],
      subtilte: json['subtilte'],
      image: json['image'],
    );
  }
}
