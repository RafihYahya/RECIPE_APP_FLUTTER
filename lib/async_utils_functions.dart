import 'dart:convert';
import 'dart:async';
import 'package:hive_flutter/adapters.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_app/data/bookmarked_data.dart';
import 'package:recipe_app/data/bookmarked_recipe_data.dart';
import 'package:recipe_app/globals.dart';
import 'package:recipe_app/data/recipe_data.dart';

Future<void> globalFetchRecipeData() async {
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

Future<void> globalFetchRecipeDataSmoll() async {
  final response = await http.get(
    Uri.parse(
        '$spoonacularUrlRecipe/random?number=${mySettings.maxNumberOfRequestsSmoll}'),
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

Future<void> fetchRecipeDataSearch(String name, List data) async {
  final response = await http.get(
    Uri.parse(
        '$spoonacularUrlRecipe/complexSearch?query=$name&number=${mySettings.maxNumberOfDisplayedRequests}'),
    headers: {
      'x-api-key': apiKey,
    },
  );

  final dataSearch = jsonDecode(response.body);
  if (response.statusCode == 200) {
    for (var e in dataSearch['results']) {
      data.add(e['id']);
      data.add(titleParserAndSafetyReworked(e['title']));
      data.add(e['image']);
    }
    //  data.add(dataSearch['results']['id'] ?? '000000');
    //data.add(dataSearch['results']['title'] ?? 'No Title');
    //data.add(dataSearch['results']['image'] ?? 'No ImageUrl');
    // return RecipeData.fromjson(data['recipes'][0]);
  } else {
    throw Exception('Failed to load Search Data');
  }
}

Future<void> fetchRecipeDataSearchToRecipeDataFormat(
    String name, final List<RecipeData> searchData) async {
  final response = await http.get(
    Uri.parse(
        'https://api.spoonacular.com/recipes/complexSearch?query=$name&addRecipeInformation=true&instructionsRequired=true&fillIngredients=true&limitLicense=false&number=${mySettings.maxNumberOfDisplayedRequests}'),
    headers: {
      'x-api-key': apiKey,
    },
  );

  final dataSearch = jsonDecode(response.body);
  if (response.statusCode == 200) {
    for (var e in dataSearch['results']) {
      searchData.add(RecipeData.fromjson2(e));
    }
  } else {
    throw Exception('Failed To Load Search Data');
  }
}

String turnListintoStringFormattedForEcoKing(List<String> tempList) {
  List<String> temp2 = [];
  for (var e in tempList) {
    if (e == tempList[0]) {
      temp2.add(e);
    } else {
      temp2.add(',+$e');
    }
  }
  return temp2.join();
}

Future<void> fetchRecipeDataEcoKingSearchToRecipeDataFormat(
    List<String> ingredList, final List<RecipeData> searchData) async {
  final response = await http.get(
    Uri.parse(
        'https://api.spoonacular.com/recipes/findByIngredients?ingredients=${turnListintoStringFormattedForEcoKing(ingredList)}&number=25'),
    headers: {
      'x-api-key': apiKey,
    },
  );

  final dataSearch = jsonDecode(response.body);
  if (response.statusCode == 200) {
    for (var e in dataSearch) {
      searchData.add(RecipeData.fromjson3(e));
    }
  } else {
    throw Exception('Failed To Load Search Data');
  }
}

Future<RecipeData> fetchAdditionalDataForEcoRecipeSearch(int id) async {
  final response = await http.get(
    Uri.parse(
        'https://api.spoonacular.com/recipes/$id/information?includeNutrition=false'),
    headers: {
      'x-api-key': apiKey,
    },
  );

  final dataSearch = jsonDecode(response.body);
  if (response.statusCode == 200) {
    RecipeData data1 = RecipeData.fromjson2(dataSearch);
    return data1;
  } else {
    throw Exception('Failed To Load Search Data');
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

void removeElementFromLocalStorage(String titleName) async {
  var bkRecipeBox = await Hive.openBox<BookMarkedRecipesList>('myBookMarks');
  if (myLocalData00 != null) {
    myLocalData00 =
        myLocalData00?.where((e) => e!.fullTitle != titleName).toList();
    bkListData.bkList = myLocalData00!
        .map((e) => e!.toBkRecipeDataFromRecipeDataTranformer())
        .toList();
    bkRecipeBox.put(0, bkListData);
  }
}
