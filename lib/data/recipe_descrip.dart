class RecipeDataDescription {
  final String? fullDescription;
  final List<String> ingredients;
  final List<String> instructions;
  final String? readMoreUrl;

  const RecipeDataDescription(
      {this.fullDescription,
      required this.ingredients,
      required this.instructions,
      this.readMoreUrl});
}
