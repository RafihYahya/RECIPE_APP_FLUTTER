import 'package:flutter/material.dart';

class HowToPage extends StatelessWidget {
  final bool? dark;
  const HowToPage({Key? key, required this.dark}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          !dark! ? const Color(0xFFDDDDDD) : const Color(0xFF252525),
      body: Container(
        child: null,
      ),
    );
  }
}
