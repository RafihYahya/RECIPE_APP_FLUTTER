import 'package:flutter/material.dart';
import 'dart:ui';

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
