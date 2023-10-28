import 'package:flutter/material.dart';
import 'package:recipe_app/async_utils_functions.dart';
import 'package:recipe_app/globals.dart';

class LoadingPage extends StatefulWidget {
  final Function callbackindex;
  const LoadingPage({Key? key, required this.callbackindex}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    fetchRecipeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ourSettings(context, false).maincolor,
      body: Center(
        child: Column(
          children: [
            Text(
              'HELLO',
              style: TextStyle(fontSize: 62.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 24.0,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    widget.callbackindex(1);
                  });
                },
                child: Text('Click ME')),
          ],
        ),
      ),
    );
  }
}
