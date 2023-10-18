import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/pages/bookmark_page.dart';
import 'package:recipe_app/pages/home_page.dart';

void main() {
  runApp(RecipeApp());
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
    print(dark);
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> routes = [
      HomePage(
        dark: dark,
        callback2: themeswitcher,
      ),
      BookMarkPage(),
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
      home: routes[0],
    );
  }
}
