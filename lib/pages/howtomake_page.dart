import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:recipe_app/components/yt_listview_comp.dart';
import 'package:recipe_app/data/recipe_descrip.dart';
import 'package:recipe_app/globals.dart';

class HowToPage extends StatelessWidget {
  final RecipeDataDescription description;
  final bool? dark;
  final String? title;
  const HowToPage(
      {super.key,
      required this.dark,
      required this.description,
      required this.title});

  @override
  Widget build(BuildContext context) {
    String osVersion = Platform.operatingSystemVersion;
    bool isApi20 = int.parse(osVersion.split('.')[0]) >= 20;

    return SafeArea(
      child: Scaffold(
        backgroundColor: !dark! ? Colors.white : const Color(0xFF252525),
        body: Stack(children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
            child: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 32.0, horizontal: 12.0),
                    child: Text(
                      'INGREDIENTS',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 36.0,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF04B400)),
                    ),
                  ),
                  SizedBox(
                    height: 400,
                    width: MediaQuery.of(context).size.width,
                    child: PageView.builder(
                      physics: const PageScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: (description.ingredients.length) ~/ 4,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: description.ingredients.length - 1 >
                                          4 * index
                                      ? Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        description
                                                                .ingredients[
                                                                    4 * index]
                                                                .imageUrl ??
                                                            defaultImageUrl)),
                                                //    color: !dark!
                                                //        ? Color(0xFFC7C7C7)
                                                //         : Color.fromARGB(255, 54, 54, 54),
                                              ),
                                              height: 125,
                                            ),
                                            const SizedBox(
                                              height: 2.0,
                                            ),
                                            Text(
                                              description.ingredients[4 * index]
                                                      .type ??
                                                  'Nothing',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18.0),
                                            ),
                                          ],
                                        )
                                      : const SizedBox(),
                                ),
                                const SizedBox(
                                  width: 28.0,
                                ),
                                Expanded(
                                  child: description.ingredients.length - 1 >
                                          4 * index + 1
                                      ? Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        description
                                                                .ingredients[
                                                                    4 * index +
                                                                        1]
                                                                .imageUrl ??
                                                            defaultImageUrl)),
                                                //    color: !dark!
                                                //        ? Color(0xFFC7C7C7)
                                                //         : Color.fromARGB(255, 54, 54, 54),
                                              ),
                                              height: 125,
                                            ),
                                            const SizedBox(
                                              height: 2.0,
                                            ),
                                            Text(
                                              description
                                                      .ingredients[
                                                          4 * index + 1]
                                                      .type ??
                                                  'Nothing',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18.0),
                                            ),
                                          ],
                                        )
                                      : const SizedBox(),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 28.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: description.ingredients.length - 1 >
                                          4 * index + 2
                                      ? Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        description
                                                                .ingredients[
                                                                    4 * index +
                                                                        2]
                                                                .imageUrl ??
                                                            defaultImageUrl)),
                                                //    color: !dark!
                                                //        ? Color(0xFFC7C7C7)
                                                //         : Color.fromARGB(255, 54, 54, 54),
                                              ),
                                              height: 125,
                                            ),
                                            const SizedBox(
                                              height: 2.0,
                                            ),
                                            Text(
                                              description
                                                      .ingredients[
                                                          4 * index + 2]
                                                      .type ??
                                                  'Nothing',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18.0),
                                            ),
                                          ],
                                        )
                                      : const SizedBox(),
                                ),
                                const SizedBox(
                                  width: 28.0,
                                ),
                                Expanded(
                                  child: description.ingredients.length - 1 >
                                          4 * index + 3
                                      ? Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        description
                                                                .ingredients[
                                                                    4 * index +
                                                                        3]
                                                                .imageUrl ??
                                                            defaultImageUrl)),
                                                //    color: !dark!
                                                //        ? Color(0xFFC7C7C7)
                                                //         : Color.fromARGB(255, 54, 54, 54),
                                              ),
                                              height: 125,
                                            ),
                                            const SizedBox(
                                              height: 2.0,
                                            ),
                                            Text(
                                              description
                                                      .ingredients[
                                                          4 * index + 3]
                                                      .type ??
                                                  'Nothing',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18.0),
                                            ),
                                          ],
                                        )
                                      : const SizedBox(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12.0, 36.0, 12.0, 36),
                    child: Text(
                      'INSTRUCTIONS',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 36.0,
                          fontWeight: FontWeight.w600,
                          color: mySettings.maincolor),
                    ),
                  ),
                  isApi20
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: ListYtComp(
                              title: title,
                              height: MediaQuery.of(context).size.height * 0.3),
                        ).animate().fade()
                      : SizedBox(),
                  const SizedBox(height: 25),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: description.instructions.length,
                      itemBuilder: ((context, index2) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 18.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: index2 % 2 == 0
                                      ? const EdgeInsets.only(right: 52.0)
                                      : const EdgeInsets.only(left: 48.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      index2 % 2 == 0
                                          ? Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0),
                                              child: Text(index2.toString(),
                                                  style: TextStyle(
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: Color.fromRGBO(
                                                          !dark! ? 0 : 255,
                                                          !dark!
                                                              ? 0 + index2 * 20
                                                              : 255,
                                                          !dark!
                                                              ? index2
                                                              : 255 -
                                                                  index2 * 10,
                                                          1))),
                                            )
                                          : const SizedBox(),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            color: !dark!
                                                ? const Color.fromARGB(
                                                    255, 211, 211, 211)
                                                : const Color.fromARGB(
                                                    255, 56, 56, 56)),
                                        width: 250,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 16.0),
                                          child: Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Text(
                                              description.instructions[index2],
                                              style: const TextStyle(
                                                fontSize: 18.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      index2 % 2 == 1
                                          ? Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 12.0),
                                              child: Text(
                                                index2.toString(),
                                                style: TextStyle(
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.w900,
                                                    color: Color.fromRGBO(
                                                        !dark! ? 0 : 255,
                                                        !dark!
                                                            ? 0 + index2 * 20
                                                            : 255,
                                                        !dark!
                                                            ? index2
                                                            : 255 - index2 * 10,
                                                        1)),
                                              ),
                                            )
                                          : const SizedBox(),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )))
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 50,
                  color: Colors.black54,
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: !dark! ? Colors.black45 : Colors.white38,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(
                    Icons.close,
                    color: !dark! ? Colors.white : Colors.black,
                    size: 32,
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
