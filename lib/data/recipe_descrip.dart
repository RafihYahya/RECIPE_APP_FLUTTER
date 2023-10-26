import 'package:recipe_app/data/recipe_ingred.dart';

class RecipeDataDescription {
  final String? fullDescription;
  final List<RecipeIngredient> ingredients;
  final List<String> instructions;
  final String? readMoreUrl;

  const RecipeDataDescription(
      {this.fullDescription,
      required this.ingredients,
      required this.instructions,
      this.readMoreUrl});
}
