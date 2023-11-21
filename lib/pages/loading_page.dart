import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:recipe_app/async_utils_functions.dart';
import 'package:recipe_app/globals.dart';

class LoadingPage extends StatefulWidget {
  final Function callbackindex;
  const LoadingPage({super.key, required this.callbackindex});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  Future<void> waitBeforeChangeIndex(int index) async => await Future.delayed(
      const Duration(seconds: 5), () => widget.callbackindex(index));

  @override
  void initState() {
    super.initState();
    globalFetchRecipeData();
    waitBeforeChangeIndex(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mySettings.loadingColor,
      body: const Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'WELCOME TO RECIPA',
            style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          Text(
            'Please Wait Few Seconds...',
            style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                color: Colors.white),
          ),
        ],
      )),
    ).animate().fade();
  }
}
