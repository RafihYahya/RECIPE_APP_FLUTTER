import 'dart:convert';

import 'package:recipe_app/data/recipe_descrip.dart';
import 'package:recipe_app/data/recipe_ingred.dart';
import 'package:recipe_app/globals.dart';

class RecipeData {
  final String? title;
  final String? fullTitle;
  final String? shortDescription;
  final String? imageUrl;
  bool isNotBookmarked;
  final RecipeDataDescription recipeDescription;
  bool isAlreadyread;

  RecipeData({
    this.title,
    this.fullTitle,
    this.shortDescription,
    this.imageUrl,
    required this.isNotBookmarked,
    required this.recipeDescription,
    required this.isAlreadyread,
  });

  static int checkSize(String jsonString) =>
      htmlRegExMiniParser(jsonString).length > 75 ? 65 : jsonString.length;

  static List<RecipeIngredient> getIngredient(dynamic json) {
    List<RecipeIngredient> myIngd = [];
    if (json['extendedIngredients'] != null) {
      for (var ingd in json['extendedIngredients']) {
        myIngd.add(RecipeIngredient(
            number: ingd['amount'] ?? '0',
            type: ingd['name'] ?? 'Nothing',
            imageUrl: ingredBaseUrl + (ingd['image'] ?? defaultImageUrl)));
      }
      return myIngd;
    } else {
      return myIngd;
    }
  }

  static List<String> getInstruct(dynamic json) {
    List<String> myInst = [];
    if (json['analyzedInstructions'].length >= 1) {
      for (var instr in json['analyzedInstructions'][0]['steps']) {
        myInst.add(instr['step']);
      }
      return myInst;
    } else {
      myInst.add('No Instructions');
      return myInst;
    }
  }

  factory RecipeData.fromjson(dynamic json) {
    return RecipeData(
        title: titleParserAndSafety(json['title']).replaceAll(',', ' '),
        fullTitle: json['title'],
        shortDescription:
            '${htmlRegExMiniParser(bigParagrapheCutter(json['summary'])).substring(0, RecipeData.checkSize(json['summary']))}...',
        imageUrl: json['image'],
        isNotBookmarked: true,
        recipeDescription: RecipeDataDescription(
            fullDescription: htmlRegExMiniParser(json['summary']),
            ingredients: RecipeData.getIngredient(json),
            instructions: RecipeData.getInstruct(json)),
        isAlreadyread: false);
  }
}



  //['title']
 //  ['image']
//['summary']
    //['analyzedInstructions'][0]['steps'][0]['number']