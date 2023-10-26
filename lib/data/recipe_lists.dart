import 'package:flutter/widgets.dart';
import 'package:recipe_app/data/recipe_data.dart';

class RecipeList extends ChangeNotifier {
  List<List<RecipeData>>? recipeDataList;
  int? fetchRangeIndicator;
  //IF YOU UPDATE SETTINGS DONT FORGET TO UPDATE THIS ONE WITH IT .
  RecipeList({this.recipeDataList, this.fetchRangeIndicator});

  void addRecipe(RecipeData data, int index) {
    recipeDataList![index].add(data);
    notifyListeners();
  }

  void removeRecipe(int index, int index2) {
    recipeDataList![index].removeAt(index2);
    notifyListeners();
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

  RecipeData? findRecipe(String title, int index) {
    return recipeDataList![index].firstWhere(
        (data) => stringOfByOneCharDetector(data.title, title) <= 1);
  }

  Iterable<RecipeData>? findListRecipe(String title, int index) {
    return recipeDataList![index]
        .where((data) => stringOfByOneCharDetector(data.title, title) <= 1);
  }
}
