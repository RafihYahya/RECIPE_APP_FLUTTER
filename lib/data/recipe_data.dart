import 'package:recipe_app/data/recipe_descrip.dart';

class RecipeData {
  final String title;
  final String? shortDescription;
  final String? imageUrl;
  bool isBookmarked;
  final RecipeDataDescription recipeDescription;
  bool isAlreadyread;

  RecipeData(
      {required this.title,
      this.shortDescription,
      this.imageUrl,
      required this.isBookmarked,
      required this.recipeDescription,
      required this.isAlreadyread});
}
