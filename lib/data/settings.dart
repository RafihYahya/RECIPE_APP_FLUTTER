import 'package:flutter/material.dart';

//FOR Local Storage
class EnvironementSettings {
  Color maincolor;
  double mainwidth;
  double mainheight;
  double maintextsize;
  Color maintextcolor;
  bool firstTime;
  double mainiconsize;
  int maxNumberOfRequests;
  int maxNumberOfDisplayedRequests;

  EnvironementSettings(
      this.maincolor,
      this.mainwidth,
      this.mainheight,
      this.maintextsize,
      this.maintextcolor,
      this.firstTime,
      this.mainiconsize,
      this.maxNumberOfDisplayedRequests,
      this.maxNumberOfRequests);

  void setToDefaults() {}
}
