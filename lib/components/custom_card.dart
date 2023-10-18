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
                child: Column(
                  children: [
                    Text('Title'),
                    Text('Description'),
                    SizedBox(height: 8.0),
                    Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.red,
                      ),
                      child: Center(child: Text('miaw')),
                    )
                  ],
                ))
          ],
        )
      ],
    );
  }
}
