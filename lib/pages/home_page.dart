import 'dart:html';

import 'package:flutter/material.dart';
import 'package:recipe_app/components/viewbuilder_horz.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  double lastScrollOffset = 0;
  // remember  position of last scroll action
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Recipa',
            ),
          ),
          backgroundColor: Colors.green,
        ),
        body: NotificationListener<ScrollNotification>(
          // Custom Scroll Behavior
          onNotification: (scrollInfo) {
            if (scrollInfo is ScrollStartNotification) {
              if (scrollInfo.metrics.pixels > lastScrollOffset) {
                double targetOffset = lastScrollOffset +
                    MediaQuery.of(context)
                        .size
                        .height; // The target pixel position
                _scrollController.animateTo(
                  //Animating The Custom Scroll,
                  targetOffset,
                  duration: const Duration(milliseconds: 750),
                  curve: Curves.easeOut,
                );
                lastScrollOffset = scrollInfo.metrics.pixels;
              } else if (scrollInfo.metrics.pixels < lastScrollOffset) {
                double targetOffset = lastScrollOffset -
                    MediaQuery.of(context).size.height *
                        0.85; // The target pixel position
                _scrollController.animateTo(
                  targetOffset,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );
                lastScrollOffset = scrollInfo.metrics.pixels;
                print(lastScrollOffset);
              } else {
                return true;
              }
            }
            return true;
          },
          child: ListView.builder(
            controller: _scrollController,
            primary: false,
            itemCount: 4,
            itemBuilder: (context, index) => ViewHorz(),
          ),
        ));
  }
}
