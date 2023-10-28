import 'package:recipe_app/data/recipe_descrip.dart';
import 'package:recipe_app/data/recipe_ingred.dart';
import 'package:recipe_app/globals.dart';

class RecipeData {
  final String title;
  final String fullTitle;
  final String? shortDescription;
  final String? imageUrl;
  bool isNotBookmarked;
  final RecipeDataDescription recipeDescription;
  bool isAlreadyread;

  RecipeData({
    required this.title,
    required this.fullTitle,
    this.shortDescription,
    this.imageUrl,
    required this.isNotBookmarked,
    required this.recipeDescription,
    required this.isAlreadyread,
  });

  static int checkSize(String jsonString) => jsonString.length >= 50 ? 50 : 5;

  factory RecipeData.fromjson(dynamic json) {
    return RecipeData(
        title: titleParserAndSafety(json['title']),
        fullTitle: json['title'],
        shortDescription:
            '${htmlRegExMiniParser(bigParagrapheCutter(json['summary'])).substring(0, (RecipeData.checkSize(json['summary'])))}...',
        imageUrl: json['image'],
        isNotBookmarked: true,
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