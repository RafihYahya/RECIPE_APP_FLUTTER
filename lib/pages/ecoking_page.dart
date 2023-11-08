import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:recipe_app/async_utils_functions.dart';
import 'package:recipe_app/components/drawer_component.dart';
import 'package:recipe_app/components/ecoKing_submit_form.dart';
import 'package:recipe_app/components/search_card.dart';
import 'package:recipe_app/components/search_empty_card.dart';
import 'package:recipe_app/data/bk_data.dart';
import 'package:recipe_app/data/recipe_data.dart';
//import 'package:recipe_app/data/recipe_descrip.dart';
import 'package:recipe_app/globals.dart';
import 'package:recipe_app/pages/desc_page.dart';

class EcoKingPage extends StatefulWidget {
  // callback and variable for dark mode
  final bool? dark;
  final Function() callback2;
  final Function callbackindex;

  const EcoKingPage(
      {super.key,
      required this.dark,
      required this.callback2,
      required this.callbackindex});

  @override
  State<EcoKingPage> createState() => _EcoKingPageState();
}

class _EcoKingPageState extends State<EcoKingPage> {
  List<RecipeData> searchResultData2 = [];
  bool toggleAnimationDelay = true;
  int animationToggler() {
    setState(() {
      toggleAnimationDelay = false;
    });
    return 200;
  }

  void ecoSearchToggler() {
    setState(() {
      ecoSearchToggle = !ecoSearchToggle;
    });
  }

  void fetchAndUpdateFunction(List<String> ingredList) async {
    searchResultData2 = [];
    if (ingredList.isNotEmpty) {
      await fetchRecipeDataEcoKingSearchToRecipeDataFormat(
          ingredList, searchResultData2);
      setState(() {});
    }
  }

  bool ecoSearchToggle = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: widget.dark!
            ? const Color.fromARGB(255, 39, 39, 39)
            : const Color.fromARGB(255, 221, 221, 221),
        appBar: AppBar(
          title: Center(
            child: Text(
              'EcoKing',
              style: widget.dark! == true
                  ? const TextStyle(color: Colors.white, fontSize: 18.0)
                  : const TextStyle(color: Colors.black, fontSize: 18.0),
            ),
          ),
          backgroundColor:
              widget.dark! ? mySettings.darkMainColor : mySettings.maincolor,
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
        drawer: MyDrawer(
          callbackindex: widget.callbackindex,
          dark: widget.dark,
          callback2: widget.callback2,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              !ecoSearchToggle
                  ? Expanded(
                      child: AnimatedContainer(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              width: MediaQuery.of(context).size.width * 0.95,
                              height: 200,
                              duration: const Duration(seconds: 1),
                              child: Container(
                                child: EcoKingSubmitForm(
                                  dark: widget.dark,
                                  callback2: widget.callback2,
                                  callback3: ecoSearchToggler,
                                  callback4: fetchAndUpdateFunction,
                                ),
                              ))
                          .animate()
                          .fadeIn(duration: Duration(milliseconds: 500)),
                    )
                  : SizedBox(),
              const SizedBox(
                height: 25,
              ),
              ecoSearchToggle
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Center(
                        child: GestureDetector(
                          onTap: () => ecoSearchToggler(),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.75,
                            height: 75,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: mySettings.maincolor,
                            ),
                            child: Center(
                                child: Text(
                              'Try Another One',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            )),
                          )
                              .animate()
                              .fadeIn(duration: Duration(milliseconds: 500)),
                        ),
                      ),
                    )
                  : SizedBox(),
              ecoSearchToggle
                  ? Expanded(
                      child: searchResultData2.isNotEmpty
                          ? Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(16.0, 28.0, 16, 0),
                              child: ListView.builder(
                                  itemCount: searchResultData2.length,
                                  itemBuilder: (context, index) =>
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: ((context) =>
                                                      DescPage(
                                                          dark: widget.dark,
                                                          data:
                                                              searchResultData2[
                                                                  index]))));
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12.0),
                                          child: BKCard2(
                                            myLocalDataInstance:
                                                searchResultData2[index],
                                            margintop: 10.0,
                                            dark: widget.dark,
                                            callback2: widget.callback2,
                                            bkdata: Bkdata(
                                                MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                25 +
                                                    MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.08,
                                                false),
                                          ).animate().fadeIn(
                                              delay: Duration(
                                                  milliseconds:
                                                      toggleAnimationDelay
                                                          ? index < 5
                                                              ? (index %
                                                                      (searchResultData2
                                                                          .length) *
                                                                      100 +
                                                                  300)
                                                              : animationToggler()
                                                          : 200),
                                              duration: const Duration(
                                                  milliseconds: 700)),
                                        ),
                                      )),
                            )
                              .animate()
                              .fadeIn(duration: Duration(milliseconds: 500))
                          : BKCard3(
                              margintop: 10.0,
                              dark: dark,
                              callback2: widget.callback2,
                              bkdata: Bkdata(
                                  MediaQuery.of(context).size.width * 0.8,
                                  MediaQuery.of(context).size.height * 0.2,
                                  false),
                            ).animate().fadeIn(
                              delay: Duration(milliseconds: 200),
                              duration: const Duration(milliseconds: 700)),
                    )
                  : SizedBox(),
            ],
          ),
        )).animate().fadeIn(duration: Duration(milliseconds: 500));
  }
}
