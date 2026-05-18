class Recipe {
  final String id;
  final String title;
  final String category;
  final String area;
  final String instructions;
  final String imageUrl;

  bool isFavorite;

  Recipe({
    required this.id,
    required this.title,
    required this.category,
    required this.area,
    required this.instructions,
    required this.imageUrl,
    this.isFavorite = false,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['idMeal'] ?? '',

      title: json['strMeal'] ?? '',

      category: json['strCategory'] ?? '',

      area: json['strArea'] ?? '',

      instructions: json['strInstructions'] ?? '',

      imageUrl: json['strMealThumb'] ?? '',
    );
  }
}
