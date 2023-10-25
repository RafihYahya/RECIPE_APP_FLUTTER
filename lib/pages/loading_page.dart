import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF04B400),
      body: Container(
        child: Center(
          child: Text(
            'HELLO',
            style: TextStyle(fontSize: 62.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
