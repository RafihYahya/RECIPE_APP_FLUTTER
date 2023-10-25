import 'package:flutter/material.dart';

//FOR Local Storage
class EnvironementSettings {
  final Color maincolor;
  final double mainwidth;
  final double mainheight;
  final double maintextsize;
  final Color maintextcolor;
  final bool firstTime;

  final double mainiconsize;

  final int maxNumberOfRequests;
  final int maxNumberOfDisplayedRequests;

  const EnvironementSettings(
      this.maincolor,
      this.mainwidth,
      this.mainheight,
      this.maintextsize,
      this.maintextcolor,
      this.firstTime,
      this.mainiconsize,
      this.maxNumberOfDisplayedRequests,
      this.maxNumberOfRequests);
}
