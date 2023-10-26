import 'package:recipe_app/data/recipe_descrip.dart';
import 'package:recipe_app/data/recipe_ingred.dart';

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

  factory RecipeData.fromjson(Map<dynamic, dynamic> json) {
    return RecipeData(
        title: json['title'],
        imageUrl: json['image'],
        isBookmarked: false,
        recipeDescription: RecipeDataDescription(
            fullDescription: json['summary'],
            ingredients: [RecipeIngredient(number: 1, type: 'miaw')],
            instructions: ['hello']),
        isAlreadyread: false);
  }
}


  //['title']
 //  ['image']
//['summary']
    //['analyzedInstructions'][0]['steps'][0]['number']