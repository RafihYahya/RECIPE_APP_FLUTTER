import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/data/recipe_lists.dart';
import 'package:recipe_app/data/settings.dart';

int indexOfPages = 0;
dynamic accessRList(BuildContext context, bool listen) =>
    Provider.of<RecipeList>(context, listen: listen);

dynamic ourSettings(BuildContext context, bool listen) =>
    Provider.of<EnvironementSettings>(context, listen: listen);

// RELEVANT API INFO
const String apiKey = '95621be83aca4fdbb584f2a7759e9509';
const String spoonacularUrlRecipe = 'https://api.spoonacular.com/recipes/';

const String ingredBaseUrl =
    'https://spoonacular.com/cdn/ingredients_100x100/butter-sliced.jpg';

List<String> constCategory = [
  "vegetarian",
  "vegan",
  "glutenFree",
  "dairyFree",
  "veryHealthy",
  "cheap",
  "veryPopular",
  "sustainable",
  "lowFodmap",
];
