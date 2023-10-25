import 'package:recipe_app/data/recipe_descrip.dart';

class RecipeData {
  final String title;
  final String? shortDescription;
  final String? imageUrl;
  final bool isBookmarked;
  final RecipeDataDescription recipeDescription;
  final bool isAlreadyread;

  const RecipeData(
      {required this.title,
      this.shortDescription,
      this.imageUrl,
      required this.isBookmarked,
      required this.recipeDescription,
      required this.isAlreadyread});
}
