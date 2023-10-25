import 'package:flutter/material.dart';

//FOR Local Storage
class EnvironementSettings extends ChangeNotifier {
  Color maincolor;
  bool firstTime;
  int maxNumberOfRequests;
  int maxNumberOfDisplayedRequests;

  EnvironementSettings(
      {required this.maincolor,
      required this.firstTime,
      required this.maxNumberOfDisplayedRequests,
      required this.maxNumberOfRequests});

  void setToDefaults() {}
}
