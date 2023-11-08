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
                          child: null,
                        ).animate().fadeIn()
                      : GestureDetector(
                          onTap: () {
                            setState(() {
                              ingredLength += 1;
                              titleToggle = true;
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
                  widget.callback3();
                  widget.callback4(tempList);
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: mySettings.maincolor),
                  padding: EdgeInsets.all(8.0),
                  width: MediaQuery.of(context).size.width * 0.43,
                  height: 70,
                  child: Center(
                      child: Text('Search',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500))),
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
                      color: Colors.red),
                  padding: EdgeInsets.all(8.0),
                  width: MediaQuery.of(context).size.width * 0.43,
                  height: 70,
                  child: Center(
                      child: Text(
                    'Reset',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
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
