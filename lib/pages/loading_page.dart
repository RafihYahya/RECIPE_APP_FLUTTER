import 'package:flutter/material.dart';
import 'package:recipe_app/async_utils_functions.dart';
import 'package:recipe_app/globals.dart';
import 'package:hive/hive.dart';

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
    fetchRecipeData();
    waitBeforeChangeIndex(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ourSettings(context, false).loadingColor,
      body: const Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'WELCOME TO RECIPA',
            style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
          ),
          Text(
            'Please Wait Few Seconds...',
            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
          ),
        ],
      )),
    );
  }
}
