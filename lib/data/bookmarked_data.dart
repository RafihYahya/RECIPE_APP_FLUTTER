import 'package:hive/hive.dart';
import 'package:recipe_app/data/bookmarked_recipe_data.dart';

part 'bookmarked_data.g.dart';

@HiveType(typeId: 0)
class BookMarkedRecipesList {
  @HiveField(0)
  int itemcount;
  @HiveField(1)
  List<BookMarkedRecipeData>? bkList;

  BookMarkedRecipesList({required this.itemcount, this.bkList});
}
