import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:recipe_app/async_utils_functions.dart';
import 'package:recipe_app/components/drawer_component.dart';
import 'package:recipe_app/components/search_card.dart';
import 'package:recipe_app/components/search_empty_card.dart';
import 'package:recipe_app/components/search_textform.dart';
import 'package:recipe_app/data/bk_data.dart';
import 'package:recipe_app/data/recipe_data.dart';
//import 'package:recipe_app/data/recipe_descrip.dart';
import 'package:recipe_app/globals.dart';
import 'package:recipe_app/pages/desc_page.dart';

class SearchPage extends StatefulWidget {
  // callback and variable for dark mode
  final bool? dark;
  final Function() callback2;
  final Function callbackindex;

  const SearchPage(
      {super.key,
      required this.dark,
      required this.callback2,
      required this.callbackindex});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<RecipeData> searchResultData = [];
  bool toggleAnimationDelay = true;
  int animationToggler() {
    toggleAnimationDelay = false;

    return 200;
  }

  void fetchAndUpdateFunction(String name) async {
    searchResultData = [];
    if (name.isNotEmpty) {
      await fetchRecipeDataSearchToRecipeDataFormat(name, searchResultData);
      setState(() {
        //    searchResultData = searchResultData;
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
                  height: 80,
                  duration: const Duration(seconds: 1),
                  child: SearchForm(
                    searchCallback: fetchAndUpdateFunction,
                    dark: widget.dark,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Expanded(
                child: searchResultData.isNotEmpty
                    ? ListView.builder(
                        itemCount: searchResultData.length,
                        itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => DescPage(
                                        dark: widget.dark,
                                        data: searchResultData[index]))));
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: BKCard2(
                                  togglebk: false,
                                  myLocalDataInstance: searchResultData[index],
                                  margintop: 10.0,
                                  dark: widget.dark,
                                  callback2: widget.callback2,
                                  bkdata: Bkdata(
                                      MediaQuery.of(context).size.width,
                                      25 +
                                          MediaQuery.of(context).size.height *
                                              0.08,
                                      false),
                                ).animate().fadeIn(
                                    delay: Duration(
                                        milliseconds: toggleAnimationDelay
                                            ? index < 5
                                                ? (index %
                                                        (searchResultData
                                                            .length) *
                                                        100 +
                                                    300)
                                                : animationToggler()
                                            : 200),
                                    duration:
                                        const Duration(milliseconds: 700)),
                              ),
                            ))
                    : BKCard3(
                        margintop: 10.0,
                        dark: dark,
                        callback2: widget.callback2,
                        bkdata: Bkdata(MediaQuery.of(context).size.width * 0.8,
                            MediaQuery.of(context).size.height * 0.2, false),
                      ).animate().fadeIn(
                        delay: const Duration(milliseconds: 200),
                        duration: const Duration(milliseconds: 700)),
              ),
            ],
          ),
        )).animate().fade(duration: const Duration(milliseconds: 500));
  }
}
