import 'package:flutter/material.dart';
import 'package:recipe_app/globals.dart';
//import 'package:recipe_app/async_utils_functions.dart';

class SearchForm extends StatefulWidget {
  final bool? dark;
  final Function searchCallback;
  const SearchForm({super.key, required this.searchCallback,this.dark});

  @override
  // ignore: library_private_types_in_public_api
  _SearchFormState createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  var myController = TextEditingController();
  bool toggleLoading = false;

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
              style: TextStyle(color:widget.dark! ? Colors.white:Colors.black ),
            ),
          ),
        ),
        GestureDetector(
            onTap: () {
              //         if (myController.text.isNotEmpty) {
              //          fetchRecipeDataSearch(myController.text, widget.dataSearch);
              //
              //        }
              setState(() {
                toggleLoading = !toggleLoading;
              });
              if (myController.text.isNotEmpty) {
                widget.searchCallback(myController.text);
                Future.delayed(const Duration(seconds: 5), () {
                  setState(() {
                    toggleLoading = !toggleLoading;
                  });
                });
              }
            },
            child: !toggleLoading
                ? const Icon(
                    Icons.search,
                    size: 36,
                  )
                : CircularProgressIndicator(
                    color: mySettings.maincolor,
                  )),
      ],
    );
  }
}
