import 'package:flutter/material.dart';

class BookMarkPage extends StatefulWidget {
  final bool? dark;
  final Function() callback2;
  const BookMarkPage({Key? key, required this.dark, required this.callback2})
      : super(key: key);

  @override
  State<BookMarkPage> createState() => _BookMarkPageState();
}

class _BookMarkPageState extends State<BookMarkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.dark!
          ? const Color.fromARGB(255, 39, 39, 39)
          : const Color.fromARGB(255, 221, 221, 221),
      appBar: AppBar(
        title: Center(
          child: Text(
            'Home Screen',
            style: widget.dark! == true
                ? const TextStyle(color: Colors.white, fontSize: 18.0)
                : const TextStyle(color: Colors.black, fontSize: 18.0),
          ),
        ),
        backgroundColor: widget.dark!
            ? const Color.fromARGB(255, 0, 116, 10)
            : const Color(0xFF04B400),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
            color: Colors.black,
            iconSize: 28.0,
          ),
          IconButton(
            onPressed: () {
              widget.callback2();
            },
            icon: !widget.dark!
                ? const Icon(Icons.dark_mode)
                : const Icon(Icons.light_mode),
            color: Colors.black,
            iconSize: 28.0,
          ),
        ],
      ),
      drawer: Drawer(),
      body: Container(
        child: null,
      ),
    );
  }
}
