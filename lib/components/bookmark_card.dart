import 'package:flutter/material.dart';
import 'package:recipe_app/async_utils_functions.dart';
import 'package:recipe_app/data/bk_data.dart';
import 'package:recipe_app/data/recipe_data.dart';
import 'package:recipe_app/globals.dart';

class BKCard extends StatefulWidget {
  final RecipeData? myLocalDataInstance;
  final double margintop;
  final bool? dark;
  final Function() callback2;
  final Function() callback3;
  final Bkdata bkdata;
  final bool togglebk;
  const BKCard(
      {super.key,
      this.myLocalDataInstance,
      required this.margintop,
      required this.dark,
      required this.callback3,
      required this.callback2,
      required this.togglebk,
      required this.bkdata});

  @override
  State<BKCard> createState() => _BKCardState();
}

class _BKCardState extends State<BKCard> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: EdgeInsets.symmetric(vertical: widget.margintop),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 211, 211, 211),
          borderRadius: BorderRadius.circular(15.0),
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.65), BlendMode.darken),
              fit: BoxFit.cover,
              image: NetworkImage(widget.myLocalDataInstance?.imageUrl ??
                  'https://media.istockphoto.com/id/1341976416/photo/healthy-eating-and-diet-concepts-top-view-of-spring-salad-shot-from-above-on-rustic-wood-table.webp?b=1&s=170667a&w=0&k=20&c=xYV0gZRXSLeAGJAPaNFaLH1V3VLNLY3KZGVL-neS1js='))),
      height: widget.bkdata.togglebk
          ? widget.bkdata.hToggler()
          : widget.bkdata.height, //league of legends scaling
      width: widget.bkdata.width,
      duration: const Duration(seconds: 1), //
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.myLocalDataInstance?.title ?? 'No Title',
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        height: 0.85,
                        color: Colors.white),
                  ),
                  const Text(
                    'Saved Locally',
                    style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                  )
                ],
              ),
            ),
            widget.togglebk
                ? GestureDetector(
                    onTap: () {
                      if (widget.myLocalDataInstance!.isNotBookmarked == true) {
                        setState(() {
                          myLocalData00!.add(widget.myLocalDataInstance);
                          writeFromRecipeDataToLocalStorageDb();
                          widget.myLocalDataInstance!.isNotBookmarked = false;
                        });
                      } else {
                        setState(() {
                          removeElementFromLocalStorage(
                              widget.myLocalDataInstance!.fullTitle ??
                                  'No Title');
                          widget.myLocalDataInstance!.isNotBookmarked = true;
                          widget.callback3();
                        });
                      }
                      //dont forget to add deletion as well
                    },
                    child: Icon(
                      widget.myLocalDataInstance!.isNotBookmarked
                          ? Icons.favorite_border
                          : Icons.favorite,
                      size: 36,
                      color: Colors.red,
                    ),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
