import 'package:flutter/material.dart';
import 'package:recipe_app/components/viewbuilder_horz.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Recipa',
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 62, 153, 65),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add),
              color: Colors.black,
              iconSize: 28.0,
            )
          ],
        ),
        drawer: Drawer(),
        body: PageView.builder(
          physics: PageScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: 20,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12.0, 8.0, 0, 0),
                    child: Text(
                      'American',
                      style: const TextStyle(fontSize: 32.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(flex: 7, child: ViewHorz())
              ],
            ),
          ),
        ));
  }
}
