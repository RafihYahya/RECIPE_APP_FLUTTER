import 'package:hive/hive.dart';
import 'package:recipe_app/data/recipe_data.dart';
import 'package:recipe_app/data/recipe_descrip.dart';
import 'package:recipe_app/data/recipe_ingred.dart';

part 'bookmarked_recipe_data.g.dart';

@HiveType(typeId: 1)
class BookMarkedRecipeData {
  @HiveField(0)
  List<String?> recipeMainData;
  @HiveField(1) // always 6 if not exist replace with default or empty []
  List<bool> recipeBoolData;
  @HiveField(2) // 2
  List<String?>? bkInstructsData;
  @HiveField(3) //unknown Size
  List<dynamic>? bkIngredsData; //Unkowns size
//up to 5 slot per ingreditem
//so index multiple of 5 per item
  BookMarkedRecipeData(
      {required this.recipeMainData,
      required this.recipeBoolData,
      this.bkIngredsData,
      this.bkInstructsData});

  List<RecipeIngredient> helperTransfomerFrombkToIngred() {
    List<RecipeIngredient> rpIngredlist = [];
    if (bkIngredsData == null) {
      rpIngredlist = [];
      return rpIngredlist;
    } else {
      for (var i = 0; i < bkIngredsData!.length; i = i + 5) {
        rpIngredlist.add(RecipeIngredient(
            id: bkIngredsData![i] ?? 'Unknown',
            number: bkIngredsData![i + 1] ?? '0',
            type: bkIngredsData![i + 2] ?? 'No Ingred',
            image: bkIngredsData![i + 3],
            imageUrl: bkIngredsData![i + 4] ?? 'No ImageURL'));
      }
      return rpIngredlist;
    }
  }

  RecipeData fromBkToRecipeDataTransformer() {
    return RecipeData(
      title: recipeMainData[0] ?? 'No Title',
      fullTitle: recipeMainData[1] ?? 'No FullTitle',
      shortDescription: recipeMainData[2] ?? 'No Desc',
      imageUrl: recipeMainData[3] ?? 'No Url',
      isNotBookmarked: recipeBoolData[0],
      isAlreadyread: recipeBoolData[1],
      recipeDescription: RecipeDataDescription(
        fullDescription: recipeMainData[4] ?? 'No DESC',
        readMoreUrl: recipeMainData[5] ?? 'No URL',
        ingredients: helperTransfomerFrombkToIngred(),
        instructions: bkInstructsData!.map((e) => e ?? 'No Instruct').toList(),
      ),
    );
  }
}
