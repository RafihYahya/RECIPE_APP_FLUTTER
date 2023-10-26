import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/data/recipe_lists.dart';
import 'package:recipe_app/data/settings.dart';

//----------------------------------------------------------------
//----------------------------------------------------------------
//Main Global Variables And Classes At Launch
//----------------------------------------------------------------
RecipeList myRecipeList = RecipeList(
    fetchRangeIndicator: 5,
    recipeDataList: List.filled(totalCategoriesNum, []));
EnvironementSettings mySettings = EnvironementSettings(
    maincolor: const Color(0xFF04B400),
    firstTime: true,
    maxNumberOfRequests: 100,
    maxNumberOfDisplayedRequests: 25);

int indexOfPages = 0;
bool dark = false;

//----------------------------------------------------------------
//----------------------------------------------------------------
//----------------------------------------------------------------

dynamic accessRList(BuildContext context, bool listen) =>
    Provider.of<RecipeList>(context, listen: listen);

dynamic ourSettings(BuildContext context, bool listen) =>
    Provider.of<EnvironementSettings>(context, listen: listen);

//----------------------------------------------------------------
// RELEVANT API INFO
//----------------------------------------------------------------

const String apiKey = '95621be83aca4fdbb584f2a7759e9509';
const String spoonacularUrlRecipe = 'https://api.spoonacular.com/recipes/';

const String ingredBaseUrl =
    'https://spoonacular.com/cdn/ingredients_100x100/butter-sliced.jpg';

const int totalCategoriesNum = 8;

List<String> constCategory = [
  'vegetarian',
  'vegan',
  'glutenFree',
  'dairyFree',
  'veryHealthy',
  'cheap',
  'veryPopular',
  'sustainable',
  'lowFodmap',
];
List<String> constCategoryBetterFormatting = [
  'Random',
  'vegetarian',
  'vegan',
  'gluten Free',
  'dairy Free',
  'very Healthy',
  'cheap',
  'very Popular',
  'sustainable',
  'low Food map',
];

////////////////////////////////////////////////////////////////
/// Functions Utils
////////////////////////////////////////////////////////////////
///
String titleParser(String title) =>
    '${title.split(' ')[0]} + ${title.split(' ')[1]}';

String htmlRegExMiniParser(String desc) =>
    desc.replaceAll(RegExp(r'<(.*?)>'), '');
