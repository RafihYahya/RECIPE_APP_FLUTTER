import 'package:flutter/material.dart';
import 'package:recipe_app/components/yt_videoplayer.dart';
import 'package:recipe_app/youtube_scraper.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  List<String?> temp = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [],
    ));
  }
}
