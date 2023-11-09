import 'package:flutter/material.dart';
import 'package:recipe_app/globals.dart';

class MyDrawer extends StatefulWidget {
  final Function callbackindex;
  final bool? dark;
  final Function() callback2;
  const MyDrawer(
      {super.key,
      required this.callbackindex,
      required this.dark,
      required this.callback2});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: widget.dark!
          ? Color.fromARGB(255, 29, 29, 29)
          : const Color.fromARGB(255, 221, 221, 221),
      child: Column(
        children: [
          Container(
            color:
                !widget.dark! ? mySettings.maincolor : mySettings.darkMainColor,
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
                    title: Text(
                      'Home Page',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: !widget.dark! ? Colors.black : Colors.white),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 4.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    selectedTileColor:
                        !dark ? mySettings.maincolor : mySettings.darkMainColor,
                    selected: globalIndex == 1 ? true : false,
                    hoverColor: !widget.dark!
                        ? mySettings.secondaryMaincolor
                        : mySettings.secondaryDarkMaincolor,
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
                    title: Text(
                      'BookMark Page',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: !widget.dark! ? Colors.black : Colors.white),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 4.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    selectedTileColor:
                        !dark ? mySettings.maincolor : mySettings.darkMainColor,
                    selected: globalIndex == 2 ? true : false,
                    hoverColor: !widget.dark!
                        ? mySettings.secondaryMaincolor
                        : mySettings.secondaryDarkMaincolor,
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
                    title: Text(
                      'Search Page',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: !widget.dark! ? Colors.black : Colors.white),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 4.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    selectedTileColor:
                        !dark ? mySettings.maincolor : mySettings.darkMainColor,
                    selected: globalIndex == 3 ? true : false,
                    hoverColor: !widget.dark!
                        ? mySettings.secondaryMaincolor
                        : mySettings.secondaryDarkMaincolor,
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
                    title: Text(
                      'EcoKing Page',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: !widget.dark! ? Colors.black : Colors.white),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 4.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    selectedTileColor:
                        !dark ? mySettings.maincolor : mySettings.darkMainColor,
                    selected: globalIndex == 4 ? true : false,
                    hoverColor: !widget.dark!
                        ? mySettings.secondaryMaincolor
                        : mySettings.secondaryDarkMaincolor,
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
          )),
          Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
              child: ListTile(
                  title: Text(
                    'About Us',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: !widget.dark! ? Colors.black : Colors.white),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 4.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  selectedTileColor:
                      !dark ? mySettings.maincolor : mySettings.darkMainColor,
                  selected: globalIndex == 5 ? true : false,
                  hoverColor: !widget.dark!
                      ? mySettings.secondaryMaincolor
                      : mySettings.secondaryDarkMaincolor,
                  onTap: () {
                    widget.callbackindex(5);
                    setState(() {
                      globalIndex = 5;
                    });
                    Navigator.pop(context);
                  }))
        ],
      ),
    );
  }
}
