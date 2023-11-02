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
      1,
      (index) => BookMarkedRecipeData(
            recipeMainData: ['', '', '', defaultImageUrl, '', ''],
            recipeBoolData: [false, true],
            bkInstructsData: ['', '', '', ''],
          ));
  bkRecipeBox.put(0, bkListData);
}

void addToHiveDbBkClass() async {
  var bkRecipeBox = await Hive.openBox<BookMarkedRecipesList>('myBookMarks');
  bkRecipeBox.put(0, bkListData);
}

void readFromBoxRecipeDataList() async {
  var bkRecipeBox = await Hive.openBox<BookMarkedRecipesList>('myBookMarks');
  bkRecipeBox.get(0);
}

void readFromBoxRecipeDataList2(RecipeData? data, int index) async {
  var bkRecipeBox = await Hive.openBox<BookMarkedRecipesList>('myBookMarks');
  data = bkRecipeBox.get(0)!.bkList![index].fromBkToRecipeDataTransformer();
}

void readFromBoxRecipeDataList3(List<RecipeData?>? data) async {
  var bkRecipeBox = await Hive.openBox<BookMarkedRecipesList>('myBookMarks');
  data = bkRecipeBox
      .get(0)!
      .bkList!
      .map((e) => e.fromBkToRecipeDataTransformer())
      .toList();
}

void readFromBoxRecipeDataList4() async {
  var bkRecipeBox = await Hive.openBox<BookMarkedRecipesList>('myBookMarks');

  if (bkRecipeBox.get(0) == null) {
    bkListData.bkList = List.generate(
        1,
        (index) => BookMarkedRecipeData(
              recipeMainData: ['', '', '', defaultImageUrl, '', ''],
              recipeBoolData: [false, true],
              bkInstructsData: ['', '', '', ''],
            ));
    bkRecipeBox.put(0, bkListData);
  } else {
    myLocalData00 = bkRecipeBox
        .get(0)!
        .bkList!
        .map((e) => e.fromBkToRecipeDataTransformer())
        .toList();
  }
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

void writeFromRecipeDataToLocalStorageDb() async {
  var bkRecipeBox = await Hive.openBox<BookMarkedRecipesList>('myBookMarks');
  bkListData.bkList = myLocalData00!
      .map((e) => e!.toBkRecipeDataFromRecipeDataTranformer())
      .toList();
  bkListData.itemcount += 1;
  bkRecipeBox.put(0, bkListData);
}
