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
          /* IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
            color: Colors.black,
            iconSize: 28.0,
          ), */
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
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Made By RafihYahya',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 24,
              ),
              Center(
                child: Text(
                  'Thank You, for any issue, please contact me at:',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              Text(
                'rafihyahya@gmail.com',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
