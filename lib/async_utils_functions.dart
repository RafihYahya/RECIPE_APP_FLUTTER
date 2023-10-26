import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:recipe_app/globals.dart';
import 'package:recipe_app/data/recipe_data.dart';

Future<RecipeData> fetchRecipeData() async {
  final response = await http.get(
    Uri.parse('$spoonacularUrlRecipe/random'),
    headers: {
      'x-api-key': apiKey,
    },
  );
  final data = jsonDecode(response.body);

  if (response.statusCode == 200) {
    return RecipeData.fromjson(data['recipes'][0]);
  } else {
    throw Exception('Failed to load Data');
  }
}

dynamic orderRecipeData(Map<dynamic, dynamic> data) {}




// RecipeApp getARecipe(){} 