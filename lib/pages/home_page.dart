import 'package:flutter/material.dart';
import 'package:recipe_app/components/viewbuilder_horz.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            'RECIPIA',
            style: TextStyle(fontWeight: FontWeight.w500),
          )),
          backgroundColor: Colors.deepOrangeAccent,
        ),
        body: ListView.builder(
          controller: ScrollController(),
          itemCount: 5,
          itemBuilder: (context, index) => ViewHorz(),
        ));
  }
}
