import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:recipe_app/async_utils_functions.dart';
import 'package:recipe_app/data/recipe_data.dart';
import 'package:recipe_app/globals.dart';
import 'package:recipe_app/pages/calories_page.dart';
//import 'package:recipe_app/pages/bookmark_page.dart';
import 'package:recipe_app/pages/howtomake_page.dart';

class DescPage extends StatefulWidget {
  final RecipeData data;
  final bool? dark;
  const DescPage({super.key, required this.dark, required this.data});

  @override
  State<DescPage> createState() => _DescPageState();
}

class _DescPageState extends State<DescPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:
            !widget.dark! ? const Color(0xFFDDDDDD) : const Color(0xFF252525),
        body: ListView(
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              widget.data.imageUrl ?? defaultImageUrl),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              mySettings.maincolor.withOpacity(0.15),
                              BlendMode.darken))),
                  height: 230 + MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width,
                  child: null,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 50,
                    color: Colors.black54,
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 14.0, horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.data.fullTitle ?? 'No Title',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                height: 0.85,
                                color:
                                    widget.dark! ? Colors.white : Colors.black),
                          ),
                          Text(
                            'Pending',
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                                color: mySettings.maincolor),
                          )
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (widget.data.isNotBookmarked == true) {
                            // bkListData.bkList?.add(widget.data
                            //    .toBkRecipeDataFromRecipeDataTranformer());
                            // bkListData.itemcount += 1;
                            // addToHiveDbBkClass();
                            myLocalData00!.add(widget.data);
                            writeFromRecipeDataToLocalStorageDb();
                          } else {
                            removeElementFromLocalStorage(
                                widget.data.fullTitle ?? 'No Title');
                          }
                          //dont forget to add deletion as well
                          widget.data.isNotBookmarked =
                              !widget.data.isNotBookmarked;
                        });
                      },
                      child: Icon(
                        widget.data.isNotBookmarked
                            ? Icons.favorite_border
                            : Icons.favorite,
                        color: Colors.red,
                        size: 42,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 14.0, horizontal: 24.0),
              child: Text(
                widget.data.recipeDescription.fullDescription ??
                    'No Description',
                style: TextStyle(
                    color: widget.dark! ? Colors.white : Colors.black),
                textAlign: TextAlign.justify,
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.065,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: const Color(0xFF04B400),
                      borderRadius: BorderRadius.circular(8.0)),
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 65,
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => HowToPage(
                              description: widget.data.recipeDescription,
                              dark: widget.dark,
                              title: widget.data.fullTitle,
                            ))),
                    child: const Center(
                      child: Text(
                        'HOW TO MAKE',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8.0)),
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 65,
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => CaloriePage())),
                    child: const Center(
                      child: Text(
                        'CALORIES',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
              ],
            )
          ],
        ).animate().fade(),
      ),
    );
  }
}
