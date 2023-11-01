import 'package:flutter/material.dart';
import 'package:recipe_app/globals.dart';

class CustomCardMainPEmpty extends StatelessWidget {
  const CustomCardMainPEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.55), BlendMode.darken),
                    image: const NetworkImage(defaultImageUrl),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.black38),
            child: null),
        const Column(
          children: [
            Expanded(flex: 6, child: SizedBox()),
            Expanded(
                flex: 8,
                child: Padding(
                  padding: EdgeInsets.only(right: 54.0),
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8.0),
                        Padding(
                          padding: EdgeInsets.only(bottom: 14.0),
                          child: Text(('LOADING'),
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 54.0,
                                  color: Colors.white,
                                  height: 1.0)),
                        ),
                        Text('Please Wait A bit...',
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.white)),
                        SizedBox(height: 24.0),
                      ],
                    ),
                  ),
                ))
          ],
        )
      ],
    );
  }
}
