import 'package:flutter/material.dart';
import 'package:recipe_app/data/bk_data.dart';

class BKCard extends StatefulWidget {
  final bool? dark;
  final Function() callback2;
  final Bkdata bkdata;
  const BKCard(
      {Key? key,
      required this.dark,
      required this.callback2,
      required this.bkdata})
      : super(key: key);

  @override
  State<BKCard> createState() => _BKCardState();
}

class _BKCardState extends State<BKCard> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.redAccent, borderRadius: BorderRadius.circular(8.0)),
      height: widget.bkdata.togglebk
          ? widget.bkdata.hToggler()
          : widget.bkdata.height, //league of legends scaling
      width: widget.bkdata.width, //
      child: Center(child: Text('MIIIIIIIIAW')),
      duration: const Duration(seconds: 1),
    );
  }
}
