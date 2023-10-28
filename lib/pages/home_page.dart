import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/components/viewbuilder_horz.dart';
import 'package:recipe_app/data/recipe_lists.dart';
import 'package:recipe_app/globals.dart';

class HomePage extends StatefulWidget {
  final bool? dark;
  final Function() callback2;
  const HomePage({Key? key, this.dark, required this.callback2})
      : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: widget.dark!
            ? const Color.fromARGB(255, 39, 39, 39)
            : const Color.fromARGB(255, 221, 221, 221),
        appBar: AppBar(
          title: Center(
            child: Text(
              'Home Screen',
              style: widget.dark! == true
                  ? const TextStyle(color: Colors.white, fontSize: 18.0)
                  : const TextStyle(color: Colors.black, fontSize: 18.0),
            ),
          ),
          backgroundColor: widget.dark!
              ? const Color.fromARGB(255, 0, 116, 10)
              : const Color(0xFF04B400),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
              color: Colors.black,
              iconSize: 28.0,
            ),
            IconButton(
              onPressed: () {
                widget.callback2();
              },
              icon: !widget.dark!
                  ? const Icon(Icons.dark_mode)
                  : const Icon(Icons.light_mode),
              color: Colors.black,
              iconSize: 28.0,
            ),
          ],
        ),
        drawer: Drawer(),
        body: Consumer<RecipeList>(
          builder: (context, value, child) => PageView.builder(
            //for page scroll
            physics: const PageScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: 10,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12.0, 8.0, 0, 0),
                      child: Text(
                        constCategoryBetterFormatting[index].toUpperCase(),
                        style: const TextStyle(fontSize: 36.0),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 7,
                      child: ViewHorz(
                        dark: widget.dark,
                        // api sequence in different order
                        //so had to use custom ternary for manually
                        //changing the order
                        recipeListValue: index == 0
                            ? value.recipeDataList![9]
                            : value.recipeDataList![index - 1],
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}
