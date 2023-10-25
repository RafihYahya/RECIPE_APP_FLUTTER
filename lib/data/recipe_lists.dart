import 'package:recipe_app/data/recipe_data.dart';

class RecipeList {
  final List<RecipeData>? recipeDataList;
  final int? fetchRangeIndicator;
  //IF YOU UPDATE SETTINGS DONT FORGET TO UPDATE THIS ONE WITH IT .
  const RecipeList({this.recipeDataList, this.fetchRangeIndicator});

  void addRecipe(RecipeData data) {
    recipeDataList!.add(data);
  }

  void removeRecipe(int index) {
    recipeDataList!.removeAt(index);
  }

  int stringOfByOneCharDetector(String value1, String value2) {
    String v1 = value1.toLowerCase();
    String v2 = value2.toLowerCase();
    int total = 0;
    v1.length > v2.length
        ? v2 = v2.padRight(v1.length - v2.length)
        : v1 = v1.padRight(v2.length - v1.length);
    for (int i = 0; i < v1.length; i++) {
      if (v1[i] != v2[i]) {
        total += 1;
      }
    }
    return total;
  }

  RecipeData? findRecipe(String title) {
    return recipeDataList!.firstWhere(
        (data) => stringOfByOneCharDetector(data.title, title) <= 1);
  }

  Iterable<RecipeData>? findListRecipe(String title) {
    return recipeDataList!
        .where((data) => stringOfByOneCharDetector(data.title, title) <= 1);
  }
}