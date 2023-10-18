import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/pages/bookmark_page.dart';
import 'package:recipe_app/pages/home_page.dart';

void main() {
  runApp(RecipeApp());
}

class RecipeApp extends StatelessWidget {
  RecipeApp({Key? key}) : super(key: key);

  final List<Widget> routes = [
    HomePage(),
    BookMarkPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.inter().fontFamily,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: routes[0],
    );
  }
}
