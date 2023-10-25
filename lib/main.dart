import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/data/recipe_lists.dart';
import 'package:recipe_app/globals.dart';
import 'package:recipe_app/pages/bookmark_page.dart';
import 'package:recipe_app/pages/ecoking_page.dart';
import 'package:recipe_app/pages/home_page.dart';
import 'package:recipe_app/pages/loading_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatefulWidget {
  const RecipeApp({Key? key}) : super(key: key);

  @override
  State<RecipeApp> createState() => _RecipeAppState();
}

class _RecipeAppState extends State<RecipeApp> {
  bool dark = false;
  void themeswitcher() {
    setState(() {
      dark = !dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> routes = [
      LoadingPage(),
      HomePage(
        dark: dark,
        callback2: themeswitcher,
      ),
      BookMarkPage(
        dark: dark,
        callback2: themeswitcher,
      ),
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
      home: ChangeNotifierProvider(
          create: (context) => RecipeList(), child: routes[indexOfPages]),
    );
  }
}
