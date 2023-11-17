import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CaloriePage extends StatefulWidget {
  final bool dark;
  const CaloriePage({super.key, required this.dark});

  @override
  State<CaloriePage> createState() => _CaloriePageState();
}

class _CaloriePageState extends State<CaloriePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:
            !widget.dark ? const Color(0xFFDDDDDD) : const Color(0xFF252525),
        body: ListView(
          children: [
            Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: Text('Coming Soon'),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 50,
                        color: Colors.black54,
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: !widget.dark ? Colors.black45 : Colors.white38,
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(
                          Icons.close,
                          color: !widget.dark ? Colors.white : Colors.black,
                          size: 32,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ).animate().fade(),
      ),
    );
  }
}
