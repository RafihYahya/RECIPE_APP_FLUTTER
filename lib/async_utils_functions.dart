import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:recipe_app/globals.dart';
import 'package:recipe_app/data/recipe_data.dart';

Future<void> fetchRecipeData() async {
  final response = await http.get(
    Uri.parse('$spoonacularUrlRecipe/random?number=100'),
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