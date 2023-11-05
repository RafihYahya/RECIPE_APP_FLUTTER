import 'package:flutter/material.dart';
//import 'package:recipe_app/async_utils_functions.dart';

class SearchForm extends StatefulWidget {
  final Function searchCallback;
  const SearchForm({super.key, required this.searchCallback});

  @override
  // ignore: library_private_types_in_public_api
  _SearchFormState createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  var myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            width: 150,
            height: 100,
            child: TextField(
              controller: myController,
            ),
          ),
        ),
        GestureDetector(
            onTap: () {
              //         if (myController.text.isNotEmpty) {
              //          fetchRecipeDataSearch(myController.text, widget.dataSearch);
              //          }
              if (myController.text.isNotEmpty) {
                widget.searchCallback(myController.text);
              }
            },
            child: const Icon(
              Icons.search,
              size: 36,
            )),
      ],
    );
  }
}
