import 'package:flutter/material.dart';

class CustomCardMainP extends StatelessWidget {
  const CustomCardMainP({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        Column(
          children: [
            Expanded(flex: 2, child: SizedBox()),
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(right: 48.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Title'),
                      SizedBox(height: 28.0),
                      Text('Description'),
                      SizedBox(height: 28.0),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: Colors.red,
                        ),
                        child: Center(child: Text('miaw')),
                      )
                    ],
                  ),
                ))
          ],
        )
      ],
    );
  }
}
