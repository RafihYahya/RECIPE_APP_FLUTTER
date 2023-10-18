import 'package:flutter/material.dart';
import 'package:recipe_app/components/custom_card.dart';

class ViewHorz extends StatefulWidget {
  ViewHorz({Key? key}) : super(key: key);

  @override
  _ViewHorzState createState() => _ViewHorzState();
}

class _ViewHorzState extends State<ViewHorz> {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        physics: PageScrollPhysics(),
        itemCount: 10,
        itemBuilder: ((context, index) => Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 0, 36.0, 16.0),
              child: CustomCardMainP(),
            )));
  }
}
