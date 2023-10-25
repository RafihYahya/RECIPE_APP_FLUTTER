import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/data/recipe_lists.dart';

int indexOfPages = 0;
dynamic accessRList(BuildContext context, bool listen) =>
    Provider.of<RecipeList>(context, listen: listen);
