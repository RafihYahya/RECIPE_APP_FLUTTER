import 'package:recipe_app/data/recipe_descrip.dart';
import 'package:recipe_app/data/recipe_ingred.dart';
import 'package:recipe_app/globals.dart';

class RecipeData {
  final String title;
  final String fullTitle;
  final String? shortDescription;
  final String? imageUrl;
  bool isBookmarked;
  final RecipeDataDescription recipeDescription;
  bool isAlreadyread;

  RecipeData({
    required this.title,
    required this.fullTitle,
    this.shortDescription,
    this.imageUrl,
    required this.isBookmarked,
    required this.recipeDescription,
    required this.isAlreadyread,
  });

  factory RecipeData.fromjson(dynamic json) {
    return RecipeData(
        title: titleParserAndSafety(json['title']),
        fullTitle: json['title'],
        shortDescription:
            '${htmlRegExMiniParser(bigParagrapheCutter(json['summary'])).substring(0, 100)}...',
        imageUrl: json['image'],
        isBookmarked: false,
        recipeDescription: RecipeDataDescription(
            fullDescription: htmlRegExMiniParser(json['summary']),
            ingredients: [RecipeIngredient(number: 1, type: 'miaw')],
            instructions: ['hello']),
        isAlreadyread: false);
  }
}



  //['title']
 //  ['image']
//['summary']
    //['analyzedInstructions'][0]['steps'][0]['number']