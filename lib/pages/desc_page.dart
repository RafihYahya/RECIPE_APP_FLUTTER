import 'package:flutter/material.dart';

class DescPage extends StatelessWidget {
  const DescPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=1000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8fA%3D%3D'),
                    fit: BoxFit.cover)),
            height: 250,
            width: MediaQuery.of(context).size.width,
            child: null,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 14.0, horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'TITLE',
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            height: 0.85),
                      ),
                      Text(
                        'categories',
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.green),
                      )
                    ],
                  ),
                ),
                Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 14.0, horizontal: 24.0),
            child: Text(
                'lorem ipsum dolor sit amet, consect et nisl, sed do eiusmod tempor incididunt ut lab'),
          ),
        ],
      ),
    );
  }
}
