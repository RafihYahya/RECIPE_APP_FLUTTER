import 'package:flutter/material.dart';
import 'package:recipe_app/globals.dart';

class MyDrawer extends StatefulWidget {
  final Function callbackindex;

  const MyDrawer({super.key, required this.callbackindex});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: mySettings.drawerColor,
      child: Column(
        children: [
          Container(
            color: mySettings.maincolor,
            height: 175,
            child: null,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    title: const Text(
                      'Home Page',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 4.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    selectedTileColor:
                        !dark ? mySettings.maincolor : mySettings.darkMainColor,
                    selected: globalIndex == 1 ? true : false,
                    hoverColor: mySettings.secondaryMaincolor,
                    onTap: () {
                      widget.callbackindex(1);
                      setState(() {
                        globalIndex = 1;
                      });
                      Navigator.pop(context);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    title: const Text(
                      'BookMark Page',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 4.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    selectedTileColor:
                        !dark ? mySettings.maincolor : mySettings.darkMainColor,
                    selected: globalIndex == 2 ? true : false,
                    hoverColor: mySettings.secondaryMaincolor,
                    onTap: () {
                      widget.callbackindex(2);
                      setState(() {
                        globalIndex = 2;
                      });
                      Navigator.pop(context);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    title: const Text(
                      'Search Page',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 4.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    selectedTileColor:
                        !dark ? mySettings.maincolor : mySettings.darkMainColor,
                    selected: globalIndex == 3 ? true : false,
                    hoverColor: mySettings.secondaryMaincolor,
                    onTap: () {
                      widget.callbackindex(3);
                      setState(() {
                        globalIndex = 3;
                      });
                      Navigator.pop(context);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    title: const Text(
                      'EcoKing Page',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 4.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    selectedTileColor:
                        !dark ? mySettings.maincolor : mySettings.darkMainColor,
                    selected: globalIndex == 4 ? true : false,
                    hoverColor: mySettings.secondaryMaincolor,
                    onTap: () {
                      widget.callbackindex(4);
                      setState(() {
                        globalIndex = 4;
                      });
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
