import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:recipe_app/async_utils_functions.dart';
import 'package:recipe_app/data/bookmarked_data.dart';
import 'package:recipe_app/data/bookmarked_recipe_data.dart';
import 'package:recipe_app/globals.dart';
import 'package:recipe_app/pages/bookmark_page.dart';
import 'package:recipe_app/pages/ecoking_page.dart';
import 'package:recipe_app/pages/home_page.dart';
import 'package:recipe_app/pages/loading_page.dart';
import 'package:provider/provider.dart';

import 'package:recipe_app/pages/search_page.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookMarkedRecipesListAdapter());
  Hive.registerAdapter(BookMarkedRecipeDataAdapter());
  runApp(const RecipeApp());
}

class RecipeApp extends StatefulWidget {
  const RecipeApp({super.key});

  @override
  State<RecipeApp> createState() => _RecipeAppState();
}

class _RecipeAppState extends State<RecipeApp> {
  void themeswitcher() {
    setState(() {
      dark = !dark;
    });
  }

  void routesSwitcher(int index) {
    setState(() {
      indexOfPages = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> routes = [
      LoadingPage(
        callbackindex: routesSwitcher,
      ),
      HomePage(
        dark: dark,
        callback2: themeswitcher,
      ),
      BookMarkPage(
        dark: dark,
        callback2: themeswitcher,
      ),
      SearchPage(dark: dark, callback2: themeswitcher),
      EcokingPage(),
    ];
    return MaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.inter().fontFamily,
        useMaterial3: true,
      ),
      darkTheme: dark
          ? ThemeData.dark(useMaterial3: true)
          : ThemeData.light(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => myRecipeList,
          ),
          ChangeNotifierProvider(
            create: (context) => mySettings,
          ),
        ],
        child: routes[indexOfPages],
      ),
    );
  }
}
