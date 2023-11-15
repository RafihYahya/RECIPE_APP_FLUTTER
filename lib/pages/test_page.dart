import 'package:flutter/material.dart';

class RandomTestPage extends StatefulWidget {
  const RandomTestPage({super.key});

  @override
  State<RandomTestPage> createState() => _TestPageState();
}

class _TestPageState extends State<RandomTestPage> {
  List<String?> temp = [];

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.black38,
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [],
          ),
        ));
  }
}
