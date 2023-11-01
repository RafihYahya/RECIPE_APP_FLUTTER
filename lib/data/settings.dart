import 'package:flutter/material.dart';

//FOR Local Storage
class EnvironementSettings extends ChangeNotifier {
  Color maincolor;
  Color loadingColor;
  bool firstTime;
  int maxNumberOfRequests;
  int maxNumberOfDisplayedRequests;

  EnvironementSettings(
      {required this.maincolor,
      required this.loadingColor,
      required this.firstTime,
      required this.maxNumberOfDisplayedRequests,
      required this.maxNumberOfRequests});

  void setToDefaults() {}
}
