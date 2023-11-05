import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/data/bookmarked_data.dart';
import 'package:recipe_app/data/recipe_data.dart';
import 'package:recipe_app/data/recipe_lists.dart';
import 'package:recipe_app/data/settings.dart';

//----------------------------------------------------------------
//----------------------------------------------------------------
//Main Global Variables And Classes At Launch
//----------------------------------------------------------------
RecipeList myRecipeList = RecipeList(
    fetchRangeIndicator: 5,
    recipeDataList:
        List.generate(constCategoryBetterFormatting.length, (i) => []));
EnvironementSettings mySettings = EnvironementSettings(
    //maincolor: const Color(0xFF04B400),
    //maincolor: Color.fromARGB(255, 50, 219, 47),
    maincolor: const Color.fromARGB(255, 70, 218, 67),
    //darkMainColor: const Color.fromARGB(255, 0, 116, 10),
    darkMainColor: Color.fromARGB(255, 33, 104, 31),
    loadingColor: const Color.fromARGB(255, 70, 218, 67),
    firstTime: true,
    maxNumberOfRequests: 100,
    maxNumberOfRequestsSmoll: 25,
    maxNumberOfDisplayedRequests: 45);

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

const String ingredBaseUrl = 'https://spoonacular.com/cdn/ingredients_100x100/';

const int totalCategoriesNum = 8;

const String defaultImageUrl =
    'https://th.bing.com/th/id/R.e23184eb927ff24d2539e5dad7ad7b67?rik=%2b0ECfK%2f23Wg%2bLg&pid=ImgRaw&r=0';

List<String> constCategory = [
  'vegetarian',
  'vegan',
  'glutenFree',
  'dairyFree',
  'veryHealthy',
  'veryPopular',
  'lowFodmap',
];
List<String> constCategory2 = [
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
List<String> constCategoryBetterFormatting2 = [
  'Random',
  'vegetarian',
  'vegan',
  'gluten Free',
  'dairy Free',
  'very Healthy',
  'very Popular',
  'low Food map',
];
//Hive

List<RecipeData?>? myLocalData00 = [];

BookMarkedRecipesList bkListData =
    BookMarkedRecipesList(itemcount: 0, bkList: []);

////////////////////////////////////////////////////////////////
/// Functions Utils
////////////////////////////////////////////////////////////////
///

String titleParser(String title) => title.split(' ')[0] + title.split(' ')[1];

String titleParserAndSafety(String title) {
  List<String> temp0 = title.split(' ');
  String temp1 = temp0.length > 3
      ? '${temp0[0]} ${temp0[1]} ${(temp0[2].toLowerCase() == 'and' || temp0[2].toLowerCase() == 'of' || temp0[2].toLowerCase() == 'to' || temp0[2].toLowerCase() == 'with' || temp0[2].toLowerCase() == 'on') ? '' : '\n${temp0[2]}'}'
      : (temp0.length <= 1 ? temp0[0] : '${temp0[0]}\n${temp0[1]}');
  return temp1.toUpperCase();
}

String titleParserAndSafety2(String title) {
  List<String> temp0 = title.split(' ');
  String temp1 = temp0.length > 3
      ? '${temp0[0]} ${temp0[1]} ${(temp0[2].toLowerCase() == 'and' || temp0[2].toLowerCase() == 'of' || temp0[2].toLowerCase() == 'to' || temp0[2].toLowerCase() == 'with' || temp0[2].toLowerCase() == 'on') ? '' : temp0[2]}'
      : (temp0.length <= 1 ? temp0[0] : '${temp0[0]}\n${temp0[1]}');
  return temp1.toUpperCase();
}

String titleParserAndSafetyReworked(String title) {
  List<String> connectors = ['with', 'on', 'in', 'and', 'of', 'to'];

  return title
      .split(' ')
      .take(3)
      .where((e) => !connectors.any((b) => b == e.toLowerCase()))
      .join(' ')
      .toString();
}

String bigParagrapheCutter(String desc) {
  List<String> descList = desc.split('.');
  String descListToString = (descList[0] + descList[1]).length > 10
      ? (descList[0] + descList[1])
      : (descList[0] + descList[1] + descList[2]);
  return descListToString;
}

String htmlRegExMiniParser(String desc) =>
    desc.replaceAll(RegExp(r'<(.*?)>'), '');
