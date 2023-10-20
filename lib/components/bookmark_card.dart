import 'package:flutter/material.dart';

class BKCard extends StatelessWidget {
  final bool? dark;
  final Function() callback2;
  const BKCard({Key? key, required this.dark, required this.callback2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.redAccent, borderRadius: BorderRadius.circular(8.0)),
      height: 40 + MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width,
      child: Center(child: Text('MIIIIIIIIAW')),
    );
  }
}
