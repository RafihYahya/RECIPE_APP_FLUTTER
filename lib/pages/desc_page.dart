import 'package:flutter/material.dart';

class DescPage extends StatelessWidget {
  const DescPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=1000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8fA%3D%3D'),
                  fit: BoxFit.cover)),
          height: 300,
          width: MediaQuery.of(context).size.width,
          child: null,
        ),
        Text('data'),
        Text('Desc'),
      ],
    );
  }
}
