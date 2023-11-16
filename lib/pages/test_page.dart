import 'package:flutter/material.dart';
import 'package:recipe_app/data/recipe_data.dart';
import 'package:recipe_app/data/recipe_descrip.dart';
import 'package:recipe_app/pages/desc_page.dart';
import 'package:recipe_app/pages/howtomake_page.dart';

class RandomTestPage extends StatefulWidget {
  const RandomTestPage({super.key});

  @override
  State<RandomTestPage> createState() => _TestPageState();
}

class _TestPageState extends State<RandomTestPage> {
  List<String?> temp = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black38,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HowToPage(
                            dark: false,
                            title: '_lU1WqStAHk',
                            description: RecipeDataDescription(
                                ingredients: [], instructions: []))));
                  },
                  child: const Text('Random Make Page')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DescPage(
                            dark: false,
                            data: RecipeData(
                                isNotBookmarked: false,
                                recipeDescription: const RecipeDataDescription(
                                    ingredients: [], instructions: []),
                                isAlreadyread: false))));
                  },
                  child: const Text('Random Desc Page'))
            ],
          ),
        ));
  }
}
