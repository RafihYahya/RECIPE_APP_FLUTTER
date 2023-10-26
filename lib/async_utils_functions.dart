import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:recipe_app/globals.dart';
import 'package:recipe_app/data/recipe_data.dart';

Future<void> fetchRecipeData() async {
  final response = await http.get(
    Uri.parse('$spoonacularUrlRecipe/random?number=10'),
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
  int dataLength = data.length;
  for (var i = 0; i < dataLength; i++) {
    bool oneIsChecked = false;
    for (var j = 0; j < constCategory.length; j++) {
      // ignore: unnecessary_string_interpolations
      if (data['recipes'][i]['${constCategory[j]}'] == true) {
        oneIsChecked = true;
        myRecipeList.recipeDataList![j]
            .add(RecipeData.fromjson(data['recipes'][i]));
        //print('succ');
      }
    }
    if (oneIsChecked == false) {
      myRecipeList.recipeDataList![8]
          .add(RecipeData.fromjson(data['recipes'][i]));
      // .recipeDataList[totalCategoriesNum]
      //.add(RecipeData.fromjson(data['recipes'][i]));
    }
  }
  //print(myRecipeList.recipeDataList![0][0].title);
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