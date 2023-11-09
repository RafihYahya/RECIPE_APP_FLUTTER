import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:recipe_app/globals.dart';

class EcoKingSubmitForm extends StatefulWidget {
  final bool? dark;
  final Function() callback2;
  final Function() callback3;
  final Function callback4;
  const EcoKingSubmitForm(
      {super.key,
      this.dark,
      required this.callback2,
      required this.callback3,
      required this.callback4});

  @override
  State<EcoKingSubmitForm> createState() => _EcoKingSubmitFormState();
}

class _EcoKingSubmitFormState extends State<EcoKingSubmitForm> {
  int ingredLength = 1;
  bool titleToggle = false;
  List<String> tempList = [];
  List<TextEditingController> controllerList = [];

  void switchFromControllerToListString() {
    for (var e in controllerList) {
      tempList.add(e.text);
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    for (var e in controllerList) {
      e.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            height: 35,
          ),
          !titleToggle
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 12.0),
                  child: Text(
                    'PICK YOUR INGREDIENTS',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ).animate().fade(),
                )
              : SizedBox(),
          SizedBox(
            height: 15,
          ),
          GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 2),
              itemCount: ingredLength,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: index != ingredLength - 1
                      ? AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          decoration: BoxDecoration(
                              color: !widget.dark!
                                  ? mySettings.secondaryMaincolor
                                  : mySettings.secondaryDarkMaincolor,
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 6.0),
                              child: SizedBox(
                                width: 100,
                                child: TextField(
                                  decoration: InputDecoration(),
                                  controller: controllerList[index],
                                ),
                              ),
                            ),
                          ),
                        ).animate().fadeIn()
                      : GestureDetector(
                          onTap: () {
                            setState(() {
                              ingredLength += 1;
                              titleToggle = true;
                              controllerList.add(TextEditingController());
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            decoration: BoxDecoration(
                                color: !widget.dark!
                                    ? mySettings.maincolor
                                    : mySettings.darkMainColor,
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Icon(
                              Icons.add,
                              size: 40,
                            ),
                          ).animate().fadeIn(),
                        ))),
          SizedBox(
            height: 35,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  switchFromControllerToListString();
                  widget.callback4(tempList);
                  widget.callback3();
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: !dark
                          ? mySettings.maincolor
                          : mySettings.darkMainColor),
                  padding: EdgeInsets.all(8.0),
                  width: MediaQuery.of(context).size.width * 0.43,
                  height: 70,
                  child: Center(
                      child: Text('Search',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: dark ? Colors.white : Colors.black))),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    ingredLength = 1;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: !dark
                          ? Colors.red
                          : Color.fromARGB(255, 153, 41, 33)),
                  padding: EdgeInsets.all(8.0),
                  width: MediaQuery.of(context).size.width * 0.43,
                  height: 70,
                  child: Center(
                      child: Text(
                    'Reset',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: dark ? Colors.white : Colors.black),
                  )),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
