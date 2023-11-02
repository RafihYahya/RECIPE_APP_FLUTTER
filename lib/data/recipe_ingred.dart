class RecipeIngredient {
  double? id;
  double number;
  String? type;
  String? image;
  String? imageUrl;

  RecipeIngredient(
      {this.id,
      required this.number,
      required this.type,
      this.image,
      this.imageUrl});
}
