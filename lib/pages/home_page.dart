import 'package:flutter/material.dart';
import 'package:recipe_app/components/viewbuilder_horz.dart';

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
            ? Color.fromARGB(255, 39, 39, 39)
            : Color.fromARGB(255, 221, 221, 221),
        appBar: AppBar(
          title: Center(
            child: Text(
              'Home Screen',
              style: widget.dark! == true
                  ? TextStyle(color: Colors.white)
                  : TextStyle(color: Colors.black),
            ),
          ),
          backgroundColor: widget.dark!
              ? Color.fromARGB(255, 0, 116, 10)
              : Color.fromARGB(255, 40, 185, 21),
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
              icon: const Icon(Icons.dark_mode),
              color: Colors.black,
              iconSize: 28.0,
            ),
          ],
        ),
        drawer: Drawer(),
        body: PageView.builder(
          physics: const PageScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: 20,
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
                      'American',
                      style: const TextStyle(fontSize: 32.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(flex: 7, child: ViewHorz())
              ],
            ),
          ),
        ));
  }
}
