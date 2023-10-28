import 'package:flutter/material.dart';
import 'package:recipe_app/data/recipe_data.dart';
import 'package:recipe_app/pages/howtomake_page.dart';

class DescPage extends StatefulWidget {
  final RecipeData data;
  final bool? dark;
  const DescPage({Key? key, required this.dark, required this.data})
      : super(key: key);

  @override
  State<DescPage> createState() => _DescPageState();
}

class _DescPageState extends State<DescPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          !widget.dark! ? const Color(0xFFDDDDDD) : const Color(0xFF252525),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.data.imageUrl!),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            const Color(0xFF04B400).withOpacity(0.15),
                            BlendMode.darken))),
                height: 230 + MediaQuery.of(context).size.height * 0.05,
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
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.data.fullTitle,
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                              height: 0.85,
                              color:
                                  widget.dark! ? Colors.white : Colors.black),
                        ),
                        Text(
                          'American',
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF04B400)),
                        )
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.data.isBookmarked = !widget.data.isBookmarked;
                      });
                    },
                    child: Icon(
                      widget.data.isBookmarked
                          ? Icons.favorite_border
                          : Icons.favorite,
                      color: Colors.red,
                      size: 42,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 14.0, horizontal: 24.0),
            child: Text(
                widget.data.recipeDescription.fullDescription != null
                    ? widget.data.recipeDescription.fullDescription!
                    : "No Available Description, Please Fill An Issue",
                style: TextStyle(
                    color: widget.dark! ? Colors.white : Colors.black)),
          ),
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.065,
              ),
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xFF04B400),
                    borderRadius: BorderRadius.circular(40.0)),
                width: MediaQuery.of(context).size.width * 0.7,
                height: 65,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HowToPage(dark: widget.dark))),
                  child: const Center(
                    child: Text(
                      'How To Make',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
            ],
          )
        ],
      ),
    );
  }
}
