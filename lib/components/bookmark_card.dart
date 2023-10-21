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
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.circular(15.0),
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.65), BlendMode.darken),
              fit: BoxFit.cover,
              image: NetworkImage(
                  'https://media.istockphoto.com/id/1341976416/photo/healthy-eating-and-diet-concepts-top-view-of-spring-salad-shot-from-above-on-rustic-wood-table.webp?b=1&s=170667a&w=0&k=20&c=xYV0gZRXSLeAGJAPaNFaLH1V3VLNLY3KZGVL-neS1js='))),
      height: widget.bkdata.togglebk
          ? widget.bkdata.hToggler()
          : widget.bkdata.height, //league of legends scaling
      width: widget.bkdata.width, //
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 14.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Placeholder',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        height: 0.85,
                        color: Colors.white),
                  ),
                  Text(
                    'subtitle',
                    style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                  )
                ],
              ),
            ),
            Icon(
              Icons.favorite,
              size: 36,
              color: Colors.red,
            )
          ],
        ),
      ),
      duration: const Duration(seconds: 1),
    );
  }
}
