import 'package:flutter/material.dart';
import 'package:recipe_app/data/bk_data.dart';
//import 'package:recipe_app/globals.dart';

class BKCard3 extends StatefulWidget {
  final double margintop;
  final bool? dark;
  final Function() callback2;
  final Bkdata bkdata;
  const BKCard3(
      {super.key,
      required this.margintop,
      required this.dark,
      required this.callback2,
      required this.bkdata});

  @override
  State<BKCard3> createState() => _BKCardState();
}

class _BKCardState extends State<BKCard3> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: EdgeInsets.symmetric(vertical: widget.margintop),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: widget.dark == false
            ? Color.fromARGB(255, 225, 225, 225)
            : Colors.black38,
        borderRadius: BorderRadius.circular(15.0),
      ),
      height: widget.bkdata.togglebk
          ? widget.bkdata.hToggler()
          : widget.bkdata.height, //league of legends scaling
      width: widget.bkdata.width,
      duration: const Duration(seconds: 1), //
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: Text(
            'Search For A Recipe',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                height: 0.85,
                color: widget.dark == false ? Colors.black : Colors.white),
          ),
        ),
      ),
    );
  }
}
