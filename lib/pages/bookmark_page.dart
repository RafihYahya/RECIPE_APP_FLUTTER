import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:recipe_app/components/bookmark_card.dart';
import 'package:recipe_app/async_utils_functions.dart';
import 'package:recipe_app/components/drawer_component.dart';

import 'package:recipe_app/data/bk_data.dart';
import 'package:recipe_app/data/recipe_data.dart';
import 'package:recipe_app/globals.dart';

class BookMarkPage extends StatefulWidget {
  // callback and variable for dark mode
  final bool? dark;
  final Function() callback2;
  final Function callbackindex;

  const BookMarkPage(
      {super.key,
      required this.dark,
      required this.callback2,
      required this.callbackindex});

  @override
  State<BookMarkPage> createState() => _BookMarkPageState();
}

class _BookMarkPageState extends State<BookMarkPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      myLocalData00 = myLocalData00;
    });
    return Scaffold(
        backgroundColor: widget.dark!
            ? const Color.fromARGB(255, 39, 39, 39)
            : const Color.fromARGB(255, 221, 221, 221),
        appBar: AppBar(
          title: Center(
            child: Text(
              'BookMarks',
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
        drawer: MyDrawer(callbackindex: widget.callbackindex),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
              itemCount: myLocalData00?.length,
              itemBuilder: (context, index) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //So that the  title wont repeat for each tile.
                      index == 0
                          ? Container(
                              margin:
                                  const EdgeInsets.only(top: 16.0, left: 12.0),
                              height: 65,
                              child: const Text('BOOKMARKS',
                                  style: TextStyle(
                                      fontSize: 35.0,
                                      fontWeight: FontWeight.bold)))
                          : const SizedBox(),

                      // Our Custom Card
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: BKCard(
                          myLocalDataInstance: myLocalData00?[index],
                          margintop: 20.0,
                          dark: widget.dark,
                          callback2: widget.callback2,
                          bkdata: Bkdata(
                              MediaQuery.of(context).size.width,
                              45 + MediaQuery.of(context).size.height * 0.1,
                              false),
                        ).animate().fadeIn(
                            delay: Duration(milliseconds: 200),
                            duration: const Duration(milliseconds: 700)),
                      ),
                    ],
                  )),
        )).animate().fadeIn(duration: const Duration(milliseconds: 500));
  }
}
