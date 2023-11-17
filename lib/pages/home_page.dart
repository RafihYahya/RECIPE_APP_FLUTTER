import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/components/drawer_component.dart';
import 'package:recipe_app/components/viewbuilder_horz.dart';
import 'package:recipe_app/data/recipe_lists.dart';
import 'package:recipe_app/globals.dart';

class HomePage extends StatefulWidget {
  final bool? dark;
  final Function() callback2;
  final Function callbackindex;

  const HomePage(
      {super.key,
      this.dark,
      required this.callback2,
      required this.callbackindex});

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
          backgroundColor:
              widget.dark! ? mySettings.darkMainColor : mySettings.maincolor,
          actions: [
            /* IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
              color: Colors.black,
              iconSize: 28.0,
            ), */
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
        drawer: MyDrawer(
          callbackindex: widget.callbackindex,
          dark: widget.dark,
          callback2: widget.callback2,
        ),
        body: Consumer<RecipeList>(
          builder: (context, value, child) => PageView.builder(
            //for page scroll
            physics: const PageScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: 8,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 12.0),
              child: value.recipeDataList![index].isNotEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(12.0, 10.0, 0, 0),
                            child: Text(
                              constCategoryBetterFormatting2[index]
                                  .toUpperCase(),
                              style: const TextStyle(
                                  fontSize: 28.0, fontWeight: FontWeight.w600),
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
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(12.0, 8.0, 0, 0),
                            child: Text(
                              constCategoryBetterFormatting2[index]
                                  .toUpperCase(),
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
        )).animate().fade(duration: const Duration(milliseconds: 750));
  }
}
