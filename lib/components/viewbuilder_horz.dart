import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:recipe_app/async_utils_functions.dart';
import 'package:recipe_app/components/custom_card.dart';
import 'package:recipe_app/components/custom_card_empty2.dart';
import 'package:recipe_app/components/custom_card_for_empty.dart';
import 'package:recipe_app/data/recipe_data.dart';
//import 'package:recipe_app/globals.dart';

class ViewHorz extends StatefulWidget {
  final List<RecipeData> recipeListValue;
  final bool? dark;
  const ViewHorz(
      {super.key, required this.dark, required this.recipeListValue});

  @override
  ViewHorzState createState() => ViewHorzState();
}

class ViewHorzState extends State<ViewHorz> {
  /* void initState() {
    super.initState();
    widget.recipeListValue.isNotEmpty
        ? ()
        : () {};
  }
*/
  void newFetchWhenNoDataisFound(int index) async {
    if (widget.recipeListValue[index].title == 'LOADING') {
      await globalFetchRecipeDataSmoll(); //smoll Fetch 25~
      setState(() {});
    }
  }

  void newFetchWhenNoDataisFound2() async {
    await globalFetchRecipeData(); //Big Fetch 100~
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return widget.recipeListValue.isNotEmpty
        ? PageView.builder(
            physics: const PageScrollPhysics(),
            itemCount: widget.recipeListValue.length + 1,
            itemBuilder: ((context, index) => Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 0, 36.0, 16.0),
                  child: !(index == widget.recipeListValue.length)
                      ? widget.recipeListValue[index].title != 'No Title'
                          ? CustomCardMainP(
                              dark: widget.dark,
                              data: widget.recipeListValue[index],
                            ).animate().fadeIn(
                              duration: const Duration(milliseconds: 500))
                          : CustomCardMainPEmpty(
                              fetchupdateCallback: newFetchWhenNoDataisFound,
                              index: index,
                            ).animate().fadeIn(
                              duration: const Duration(milliseconds: 500))
                      : CustomCardMainPEmpty2(
                          fetchupdateCallback2: newFetchWhenNoDataisFound2,
                        )
                          .animate()
                          .fadeIn(duration: const Duration(milliseconds: 500)),
                )))
        : Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 0, 36.0, 16.0),
            child: CustomCardMainPEmpty2(
              fetchupdateCallback2: newFetchWhenNoDataisFound2,
            ).animate().fadeIn(
                delay: const Duration(milliseconds: 200),
                duration: const Duration(milliseconds: 700)));
  }
}
