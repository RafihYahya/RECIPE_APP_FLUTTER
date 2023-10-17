import 'dart:ui';

import 'package:flutter/material.dart';

class ViewHorz extends StatefulWidget {
  ViewHorz({Key? key}) : super(key: key);

  @override
  _ViewHorzState createState() => _ViewHorzState();
}

class _ViewHorzState extends State<ViewHorz> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.transparent.withOpacity(0.5),
        ),
        height: MediaQuery.of(context).size.height * 0.85,
        child: const Text(
          'Test',
          style: TextStyle(fontSize: 45.0),
        ),
      ),
    );
  }
}

class LegacyBlurOpacity extends StatelessWidget {
  const LegacyBlurOpacity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.transparent.withOpacity(0.5),
          child: const Text(
            'Test',
            style: TextStyle(fontSize: 68.0),
          ),
        ),
      ),
    );
  }
}
