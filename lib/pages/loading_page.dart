import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/async_utils_functions.dart';
import 'package:recipe_app/data/recipe_lists.dart';
import 'package:recipe_app/globals.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    fetchRecipeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ourSettings(context, false).maincolor,
      body: Container(
        child: Center(
          child: Text(
            'HELLO',
            style: TextStyle(fontSize: 62.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
