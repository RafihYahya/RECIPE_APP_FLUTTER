import 'package:flutter/material.dart';

//FOR Local Storage
class EnvironementSettings extends ChangeNotifier {
  final Color maincolor;
  Color? secondaryMaincolor;
  Color? drawerColor;
  final Color darkMainColor;
  final Color loadingColor;
  bool firstTime;
  int maxNumberOfRequests;
  int maxNumberOfRequestsSmoll;
  int maxNumberOfDisplayedRequests;

  EnvironementSettings(
      {required this.maincolor,
      this.secondaryMaincolor,
      this.drawerColor,
      required this.darkMainColor,
      required this.loadingColor,
      required this.firstTime,
      required this.maxNumberOfDisplayedRequests,
      required this.maxNumberOfRequests,
      required this.maxNumberOfRequestsSmoll});

  void setToDefaults() {}
}
