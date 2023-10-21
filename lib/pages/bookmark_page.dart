import 'package:flutter/material.dart';
import 'package:recipe_app/components/bookmark_card.dart';
import 'package:recipe_app/data/bk_data.dart';

class BookMarkPage extends StatefulWidget {
  // callback and variable for dark mode
  final bool? dark;
  final Function() callback2;
  const BookMarkPage({Key? key, required this.dark, required this.callback2})
      : super(key: key);

  @override
  State<BookMarkPage> createState() => _BookMarkPageState();
}

class _BookMarkPageState extends State<BookMarkPage> {
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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
              itemCount: 15,
              itemBuilder: (context, index) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //So that the  title wont repeat for each tile.
                      index == 0
                          ? Container(
                              margin: EdgeInsets.only(top: 16.0, left: 12.0),
                              height: 65,
                              child: const Text('BOOKMARKS',
                                  style: TextStyle(
                                      fontSize: 35.0,
                                      fontWeight: FontWeight.bold)))
                          : SizedBox(),

                      // Our Custom Card
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: BKCard(
                          dark: widget.dark,
                          callback2: widget.callback2,
                          bkdata: Bkdata(
                              MediaQuery.of(context).size.width,
                              45 + MediaQuery.of(context).size.height * 0.1,
                              false),
                        ),
                      ),
                    ],
                  )),
        ));
  }
}
