import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:recipe_app/globals.dart';
import 'package:recipe_app/data/recipe_data.dart';
import 'package:flutter/material.dart';

Future<void> fetchRecipeData(BuildContext context) async {
  final response = await http.get(
    Uri.parse('$spoonacularUrlRecipe/random'),
    headers: {
      'x-api-key': apiKey,
    },
  );
  final data = jsonDecode(response.body);

  if (response.statusCode == 200) {
    // ignore: use_build_context_synchronously
    orderRecipeData(data, context);
    // return RecipeData.fromjson(data['recipes'][0]);
  } else {
    throw Exception('Failed to load Data');
  }
}

void orderRecipeData(dynamic data, BuildContext context) {
  int dataLength = data.length;
  for (var i = 0; i < dataLength; i++) {
    bool oneIsChecked = false;
    for (var j = 0; j < constCategory.length; j++) {
      if (data[i][constCategory[j]] == true) {
        oneIsChecked = true;
        accessRList(context, false)
            .recipeDataList[j]
            .add(RecipeData.fromjson(data['recipes'][i]));
      }
    }
    if (oneIsChecked == false) {
      accessRList(context, false)
          .recipeDataList[9]
          .add(RecipeData.fromjson(data['recipes'][i]));
    }
  }
}
