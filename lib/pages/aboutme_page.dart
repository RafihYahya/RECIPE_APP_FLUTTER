import 'package:flutter/material.dart';
import 'package:recipe_app/components/drawer_component.dart';
import 'package:recipe_app/globals.dart';

class AboutMePage extends StatelessWidget {
  final bool? dark;
  final Function() callback2;
  final Function callbackindex;
  const AboutMePage(
      {super.key,
      required this.callback2,
      required this.callbackindex,
      required this.dark});

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
        width: MediaQuery.of(context).size.width,
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
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'My Name is RafihYahya',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                'Thats It',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Thats All You Need To Know',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
