import 'package:flutter/material.dart';
import 'package:recipe_app/async_utils_functions.dart';
import 'package:recipe_app/data/bk_data.dart';
import 'package:recipe_app/data/recipe_data.dart';
import 'package:recipe_app/globals.dart';

class BKCard2 extends StatefulWidget {
  final RecipeData? myLocalDataInstance;
  final double margintop;
  final bool? dark;
  final Function() callback2;
  final Bkdata bkdata;
  final bool togglebk;

  const BKCard2(
      {super.key,
      this.myLocalDataInstance,
      required this.margintop,
      required this.togglebk,
      required this.dark,
      required this.callback2,
      required this.bkdata});

  @override
  State<BKCard2> createState() => _BKCardState();
}

class _BKCardState extends State<BKCard2> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: EdgeInsets.symmetric(vertical: widget.margintop),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 211, 211, 211),
          borderRadius: BorderRadius.circular(15.0),
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.45), BlendMode.darken),
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
              child: SizedBox(
                width: 200,
                child: Text(
                  widget.myLocalDataInstance?.title ?? 'No Title',
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      height: 0.85,
                      color: Colors.white),
                ),
              ),
            ),
            widget.togglebk
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        if (widget.myLocalDataInstance!.isNotBookmarked =
                            true) {
                          // bkListData.bkList?.add(widget.data
                          //    .toBkRecipeDataFromRecipeDataTranformer());
                          // bkListData.itemcount += 1;
                          // addToHiveDbBkClass();
                          myLocalData00!.add(widget.myLocalDataInstance);
                          writeFromRecipeDataToLocalStorageDb();
                        } else {
                          removeElementFromLocalStorage(
                              widget.myLocalDataInstance!.fullTitle ??
                                  'No Title');
                        }
                        //dont forget to add deletion as well
                        widget.myLocalDataInstance!.isNotBookmarked =
                            !widget.myLocalDataInstance!.isNotBookmarked;
                      });
                    },
                    child: Icon(
                      widget.myLocalDataInstance!.isNotBookmarked
                          ? Icons.favorite_border
                          : Icons.favorite,
                      size: 36,
                      color: Colors.red,
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
