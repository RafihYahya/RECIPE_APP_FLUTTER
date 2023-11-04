import 'package:flutter/material.dart';
import 'package:recipe_app/async_utils_functions.dart';
import 'package:recipe_app/components/search_card.dart';
import 'package:recipe_app/components/search_empty_card.dart';
import 'package:recipe_app/components/search_textform.dart';
import 'package:recipe_app/data/bk_data.dart';
import 'package:recipe_app/data/recipe_data.dart';
import 'package:recipe_app/data/recipe_descrip.dart';
import 'package:recipe_app/globals.dart';

class SearchPage extends StatefulWidget {
  // callback and variable for dark mode
  final bool? dark;
  final Function() callback2;
  const SearchPage({super.key, required this.dark, required this.callback2});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List searchResultData = [];
  String? searchInput;
  void fetchAndUpdateFunction(String name) async {
    searchResultData = [];
    if (name.isNotEmpty) {
      await fetchRecipeDataSearch(name, searchResultData);
      setState(() {
        searchResultData = searchResultData;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: widget.dark!
            ? const Color.fromARGB(255, 39, 39, 39)
            : const Color.fromARGB(255, 221, 221, 221),
        appBar: AppBar(
          title: Center(
            child: Text(
              'Search',
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
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 28.0, 16, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: AnimatedContainer(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 16.0),
                  decoration: BoxDecoration(
                    color: widget.dark == false
                        ? const Color.fromARGB(255, 211, 211, 211)
                        : Colors.black38,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 85,
                  duration: Duration(seconds: 1),
                  child: SearchForm(
                    dataSearch: searchResultData,
                    searchCallback: fetchAndUpdateFunction,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: searchResultData.isNotEmpty
                    ? ListView.builder(
                        itemCount: searchResultData.length ~/ 3,
                        itemBuilder: (context, index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: BKCard2(
                                myLocalDataInstance: RecipeData(
                                    title: searchResultData[index * 3 + 1],
                                    fullTitle: '',
                                    imageUrl: searchResultData[index * 3 + 2],
                                    isNotBookmarked: true,
                                    recipeDescription: RecipeDataDescription(
                                        ingredients: [], instructions: []),
                                    isAlreadyread: false),
                                margintop: 10.0,
                                dark: widget.dark,
                                callback2: widget.callback2,
                                bkdata: Bkdata(
                                    MediaQuery.of(context).size.width,
                                    25 +
                                        MediaQuery.of(context).size.height *
                                            0.08,
                                    false),
                              ),
                            ))
                    : BKCard3(
                        margintop: 10.0,
                        dark: dark,
                        callback2: widget.callback2,
                        bkdata: Bkdata(MediaQuery.of(context).size.width * 0.8,
                            MediaQuery.of(context).size.height * 0.2, false),
                      ),
              ),
            ],
          ),
        ));
  }
}
