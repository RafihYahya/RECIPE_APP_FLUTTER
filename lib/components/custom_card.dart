import 'package:flutter/material.dart';
import 'package:recipe_app/data/recipe_data.dart';
import 'package:recipe_app/globals.dart';
import 'package:recipe_app/pages/desc_page.dart';

class CustomCardMainP extends StatelessWidget {
  final bool? dark;
  final RecipeData data;
  const CustomCardMainP({super.key, required this.dark, required this.data});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.55), BlendMode.darken),
                    image: NetworkImage(data.imageUrl != null
                        ? data.imageUrl!
                        : defaultImageUrl),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.black38),
            child: null),
        Column(
          children: [
            const Expanded(flex: 7, child: SizedBox()),
            Expanded(
                flex: 8,
                child: Padding(
                  padding: const EdgeInsets.only(right: 54.0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8.0),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 14.0),
                          child: Text((data.title),
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  fontSize: 42.0,
                                  color: Colors.white,
                                  height: 1.0)),
                        ),
                        Text(
                            data.shortDescription != null
                                ? data.shortDescription!
                                : 'No Descirption Found',
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                fontSize: 14.0, color: Colors.white)),
                        const SizedBox(height: 24.0),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.65,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: !dark!
                                ? const Color(0xFF04B400)
                                : const Color.fromRGBO(0, 116, 10, 1),
                          ),
                          child: GestureDetector(
                            onTap: () =>
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => DescPage(
                                          dark: dark,
                                          data: data,
                                        ))),
                            child: Center(
                                child: Text(
                              'READ MORE',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            )),
                          ),
                        )
                      ],
                    ),
                  ),
                ))
          ],
        )
      ],
    );
  }
}
