//import 'dart:convert';

//import 'package:flutter/material.dart';
import 'package:recipe_app/data/bookmarked_recipe_data.dart';
import 'package:recipe_app/data/recipe_descrip.dart';
import 'package:recipe_app/data/recipe_ingred.dart';
import 'package:recipe_app/globals.dart';
import 'dart:math';

class RecipeData {
  final int? id;
  final String? title;
  final String? fullTitle;
  final String? shortDescription;
  final String? imageUrl;
  bool isNotBookmarked;
  final RecipeDataDescription recipeDescription;
  bool isAlreadyread;

  RecipeData({
    this.id,
    this.title,
    this.fullTitle,
    this.shortDescription,
    this.imageUrl,
    required this.isNotBookmarked,
    required this.recipeDescription,
    required this.isAlreadyread,
  });

  RecipeData.mock()
      : id = 000000,
        title = 'PlaceHolder Title',
        fullTitle = 'BIGGER PLACEHOLDER TITLE',
        shortDescription =
            'This is To be filled with Short description about the object',
        imageUrl = defaultImageUrl,
        isNotBookmarked = true,
        isAlreadyread = false,
        recipeDescription = RecipeDataDescription(
            ingredients: [RecipeIngredient(number: 10, type: 'mockIngred')],
            instructions: ['Nothing Nothing AT all']);

  static int checkSize(String jsonString) =>
      htmlRegExMiniParser(jsonString).runes.length > 80
          ? 65
          : (jsonString.length - 10 <= 0 ? jsonString.length : 40);

  static int checkSizeReworked(String jsonString) {
    int truelength = htmlRegExMiniParser(jsonString).length;
    return truelength > 90
        ? 60
        : truelength > 70
            ? 35
            : (truelength - 10 <= 0 ? jsonString.length : 20);
  }

  static int checkSizeReworkedReverse(String jsonString) {
    int truelength = htmlRegExMiniParser(jsonString).length;
    return truelength < 10
        ? 0
        : truelength < 40
            ? 20
            : (truelength < 90 ? 55 : jsonString.split(' ').take(5).length);
  }

  static String checkSizeAlternative(String jsonString) {
    String truelength = htmlRegExMiniParser(jsonString);
    return truelength.split(' ').length < 5
        ? truelength.split(' ').length <= 3
            ? truelength.split(' ').take(1).toString()
            : truelength.split(' ').take(2).toString()
        : truelength.split(' ').take(5).toString();
  }

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

  static List<RecipeIngredient> getIngredient2(dynamic json) {
    List<RecipeIngredient> myIngd = [];
    if (json['extendedIngredients'] != null) {
      for (var ingd in json['extendedIngredients']) {
        myIngd.add(RecipeIngredient(
            number: ingd['amount'] ?? '0',
            type: ingd['name'] != null
                ? ingd['name'].toString().substring(
                    0,
                    ingd['name'].toString().length < 25
                        ? ingd['name'].toString().length
                        : ingd['name'].toString().length ~/ 1.5)
                : 'Nothing',
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
        myInst.add(instr['step'].toString().replaceAll('.', '.' '\n'));
      }
      return myInst;
    } else {
      myInst.add('No Instructions');
      return myInst;
    }
  }

  BookMarkedRecipeData toBkRecipeDataFromRecipeDataTranformer() {
    List<String?> tempList = [];
    tempList.add(title ?? 'No title');
    tempList.add(fullTitle ?? 'No title');
    tempList.add(shortDescription ?? 'No desc');
    tempList.add(imageUrl ?? 'No Url');
    tempList.add(recipeDescription.fullDescription ?? 'No Desc');
    tempList.add(recipeDescription.readMoreUrl ?? 'No Url');

    List<bool> tempListBool = [];
    tempListBool.add(isNotBookmarked);
    tempListBool.add(isAlreadyread);

    List<String?> listTempInstruct = [];
    listTempInstruct = recipeDescription.instructions;

    List<dynamic>? listTempIngreds = [];
    double idRandom = Random().nextDouble() * 200;
    for (var e in recipeDescription.ingredients) {
      listTempIngreds.add(e.id ?? idRandom);
      listTempIngreds.add(e.number ?? 404);
      listTempIngreds.add(e.type ?? 'No Ingred');
      listTempIngreds.add(e.image ?? defaultImageUrl);
      listTempIngreds.add(e.imageUrl ?? defaultImageUrl);
    }

    return BookMarkedRecipeData(
        recipeMainData: tempList,
        recipeBoolData: tempListBool,
        bkInstructsData: listTempInstruct,
        bkIngredsData: listTempIngreds);
  }

  factory RecipeData.fromjson(dynamic json) {
    return RecipeData(
        title: titleParserAndSafety(json['title'] ?? 'No Title')
            .replaceAll(',', ' ')
            .replaceAll('&', ' '),
        fullTitle: json['title'],
        shortDescription:
            '${htmlRegExMiniParser(bigParagrapheCutter(json['summary'] ?? 'No Description')).substring(0, RecipeData.checkSizeReworked(json['summary']))}...',
        imageUrl: json['image'] ?? defaultImageUrl,
        isNotBookmarked: true,
        recipeDescription: RecipeDataDescription(
            fullDescription: htmlRegExMiniParser(json['summary'] ??
                "No Available Description, Please Fill An Issue"),
            ingredients: RecipeData.getIngredient2(json),
            instructions: RecipeData.getInstruct(json)),
        isAlreadyread: false);
  }
  factory RecipeData.fromjson2(dynamic json) {
    return RecipeData(
        title: titleParserAndSafetyReworked(json['title'] ?? 'No Title')
            .replaceAll(',', ' ')
            .replaceAll('&', ' '),
        fullTitle: json['title'],
        shortDescription:
            '${htmlRegExMiniParser(bigParagrapheCutter(json['summary'] ?? 'No Description')).substring(0, RecipeData.checkSizeReworkedReverse(json['summary']))}...',
        imageUrl: json['image'] ?? defaultImageUrl,
        isNotBookmarked: true,
        recipeDescription: RecipeDataDescription(
            fullDescription: htmlRegExMiniParser(json['summary'] ??
                "No Available Description, Please Fill An Issue"),
            ingredients: RecipeData.getIngredient2(json),
            instructions: RecipeData.getInstruct(json)),
        isAlreadyread: false);
  }
  factory RecipeData.fromjson3(dynamic json) {
    return RecipeData(
        id: json['id'],
        title: titleParserAndSafetyReworked(json['title'] ?? 'No Title')
            .replaceAll(',', ' ')
            .replaceAll('&', ' '),
        fullTitle: json['title'],
        shortDescription: '',
        imageUrl: json['image'] ?? defaultImageUrl,
        isNotBookmarked: true,
        recipeDescription: RecipeDataDescription(
            fullDescription: '', ingredients: [], instructions: []),
        isAlreadyread: false);
  }

//
/*
  factory RecipeData.fromjsonForSearchData(final json) {
    return RecipeData(
        isNotBookmarked: false,
        recipeDescription:
            RecipeDataDescription(ingredients: [], instructions: []),
        isAlreadyread: false);
  }
  */
}



  //['title']
 //  ['image']
//['summary']
    //['analyzedInstructions'][0]['steps'][0]['number']