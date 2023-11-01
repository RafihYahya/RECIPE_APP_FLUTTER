import 'dart:convert';
import 'dart:async';
import 'package:hive_flutter/adapters.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_app/data/bookmarked_data.dart';
import 'package:recipe_app/data/bookmarked_recipe_data.dart';
import 'package:recipe_app/globals.dart';
import 'package:recipe_app/data/recipe_data.dart';

Future<void> fetchRecipeData() async {
  final response = await http.get(
    Uri.parse(
        '$spoonacularUrlRecipe/random?number=${mySettings.maxNumberOfRequests}'),
    headers: {
      'x-api-key': apiKey,
    },
  );

  final data = jsonDecode(response.body);
  if (response.statusCode == 200) {
    orderRecipeData(data);

    // return RecipeData.fromjson(data['recipes'][0]);
  } else {
    throw Exception('Failed to load Data');
  }
}

void orderRecipeData(dynamic data) {
  int dataLength = mySettings.maxNumberOfRequests;
  for (var i = 0; i < dataLength; i++) {
    bool oneIsNotChecked = true;
    for (var j = 0; j < constCategory.length; j++) {
      if (data['recipes'][i][constCategory[j]] == true) {
        oneIsNotChecked = false;
        myRecipeList.recipeDataList![j]
            .add(RecipeData.fromjson(data['recipes'][i]));
      }
    }
    if (oneIsNotChecked == true) {
      myRecipeList.recipeDataList![constCategoryBetterFormatting.length - 1]
          .add(RecipeData.fromjson(data['recipes'][i]));
    }
  }
}

////////////////////////////////////////////////////////////////
//----------------------------------------------------------------
// FireBase Utils Here
//----------------------------------------------------------------
////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////
//----------------------------------------------------------------
//Local Storage Utils Here
//----------------------------------------------------------------
////////////////////////////////////////////////////////////////

void addToBoxRecipeDataList() async {
  var bkRecipeBox = await Hive.openBox<BookMarkedRecipesList>('myBookMarks');
  bkListData.bkList = List.generate(
      5,
      (index) => BookMarkedRecipeData(
          recipeMainData: ['something', 'somethign else'],
          recipeBoolData: [false, true]));
  bkRecipeBox.put(0, bkListData);
}

void readFromBoxRecipeDataList() async {
  var bkRecipeBox = await Hive.openBox<BookMarkedRecipesList>('myBookMarks');
  print(bkRecipeBox.get(0)!.bkList![0].recipeMainData[0]);
}

void addToBoxRecipeDataList2() async {
  var bkRecipeBox = await Hive.openBox<BookMarkedRecipesList>('myBookMarks');
  bkListData.bkList = List.generate(
      5,
      (index) => BookMarkedRecipeData(
          recipeMainData: ['something2', 'somethign else2'],
          recipeBoolData: [false, true]));
  bkRecipeBox.put(0, bkListData);
}
