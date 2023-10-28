import 'package:flutter/material.dart';
import 'package:recipe_app/components/custom_card.dart';
import 'package:recipe_app/components/custom_card_for_empty.dart';
import 'package:recipe_app/data/recipe_data.dart';

class ViewHorz extends StatefulWidget {
  final List<RecipeData> recipeListValue;
  final bool? dark;
  const ViewHorz({Key? key, required this.dark, required this.recipeListValue})
      : super(key: key);

  @override
  ViewHorzState createState() => ViewHorzState();
}

class ViewHorzState extends State<ViewHorz> {
  @override
  Widget build(BuildContext context) {
    return widget.recipeListValue.isNotEmpty
        ? PageView.builder(
            physics: const PageScrollPhysics(),
            itemCount: widget.recipeListValue.length,
            itemBuilder: ((context, index) => Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 0, 36.0, 16.0),
                  child: CustomCardMainP(
                    dark: widget.dark,
                    data: widget.recipeListValue[index],
                  ),
                )))
        : const Padding(
            padding: EdgeInsets.fromLTRB(12.0, 0, 36.0, 16.0),
            child: CustomCardMainPEmpty());
  }
}
