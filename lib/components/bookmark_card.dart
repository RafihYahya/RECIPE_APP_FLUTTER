import 'package:flutter/material.dart';

class BKCard extends StatelessWidget {
  const BKCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(color: Colors.red),
      height: 300,
      width: 300,
      child: Text('MIIIIIIIIAW'),
    );
  }
}
