import 'package:flutter/material.dart';

class DescPage extends StatelessWidget {
  final bool? dark;
  const DescPage({Key? key, required this.dark}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: !dark! ? Color(0xFFDDDDDD) : Color(0xFF252525),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&q=80&w=1000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8fA%3D%3D'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.green.withOpacity(0.15), BlendMode.darken))),
                height: 250,
                width: MediaQuery.of(context).size.width,
                child: null,
              ),
              Container(
                height: 50,
                color: Colors.black54,
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 14.0, horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'MOMBALA',
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            height: 0.85),
                      ),
                      Text(
                        'American',
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
                  size: 42,
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 14.0, horizontal: 24.0),
            child: Text(
                'lorem ipsum dolor sit amet, consect et nisl,lorem ipsum dolor sit amet, consect et nisl,lorem ipsum dolor sit amet, consect et nisl,lorem ipsum dolor sit amet, consect et nisl,lorem ipsum dolor sit amet, consect et nisl,lorem ipsum dolor sit amet, consect et nisl sed do eiusmod tempor incididunt ut lab'),
          ),
        ],
      ),
    );
  }
}
