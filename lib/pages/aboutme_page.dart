import 'package:flutter/material.dart';
import 'package:recipe_app/components/drawer_component.dart';
import 'package:recipe_app/globals.dart';

class AboutMePage extends StatelessWidget {
  final bool? dark;
  final Function() callback2;
  final Function callbackindex;
  const AboutMePage(
      {Key? key,
      required this.callback2,
      required this.callbackindex,
      required this.dark})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'BookMarks',
            style: dark! == true
                ? const TextStyle(color: Colors.white, fontSize: 18.0)
                : const TextStyle(color: Colors.black, fontSize: 18.0),
          ),
        ),
        backgroundColor:
            dark! ? mySettings.darkMainColor : mySettings.maincolor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
            color: Colors.black,
            iconSize: 28.0,
          ),
          IconButton(
            onPressed: () {
              callback2();
            },
            icon: !dark!
                ? const Icon(Icons.dark_mode)
                : const Icon(Icons.light_mode),
            color: Colors.black,
            iconSize: 28.0,
          ),
        ],
      ),
      drawer: MyDrawer(
          callbackindex: callbackindex, dark: dark, callback2: callback2),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              !dark!
                  ? const Color.fromARGB(255, 221, 221, 221)
                  : const Color.fromARGB(255, 39, 39, 39),
              !dark!
                  ? const Color.fromARGB(255, 221, 221, 221)
                  : const Color.fromARGB(255, 39, 39, 39),
              !dark!
                  ? mySettings.secondaryMaincolor!
                  : mySettings.secondaryDarkMaincolor!,
            ])),
        child: const Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                'My Name is RafihYahya',
                style: TextStyle(fontSize: 14),
              ),
              Text(
                'My Github:',
                style: TextStyle(fontSize: 14),
              ),
              Text(
                'CheckOut My Other Stuffs',
                style: TextStyle(fontSize: 14),
              ),
              Text(
                'So Far All My Works Is OpenSource With GNU License',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
