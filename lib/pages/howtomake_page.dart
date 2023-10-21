import 'package:flutter/material.dart';

class HowToPage extends StatelessWidget {
  final bool? dark;
  const HowToPage({Key? key, required this.dark}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          !dark! ? const Color(0xFFDDDDDD) : const Color(0xFF252525),
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 32.0, horizontal: 12.0),
                child: Text(
                  'INGREDIENTS',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 36.0,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF04B400)),
                ),
              ),
              Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
                child: PageView.builder(
                  physics: PageScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 15,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Color(0xFFC7C7C7),
                                  ),
                                  height: 100,
                                  child: Center(
                                      child: Text(
                                    '10 EGG',
                                    style: TextStyle(fontSize: 18.0),
                                  ))),
                            ),
                            SizedBox(
                              width: 28.0,
                            ),
                            Expanded(
                              child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: const Color(0xFFC7C7C7),
                                  ),
                                  height: 100,
                                  child: Center(
                                      child: Text('10 EGG',
                                          style: TextStyle(fontSize: 18.0)))),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 28.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Color(0xFFC7C7C7),
                                  ),
                                  height: 100,
                                  child: Center(
                                      child: Text('10 EGG',
                                          style: TextStyle(fontSize: 18.0)))),
                            ),
                            SizedBox(
                              width: 28.0,
                            ),
                            Expanded(
                              child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Color(0xFFC7C7C7),
                                  ),
                                  height: 100,
                                  child: Center(
                                      child: Text('10 EGG',
                                          style: TextStyle(fontSize: 18.0)))),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(12.0, 36.0, 12.0, 54),
                child: Text(
                  'INSTRUCTIONS',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 36.0,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF04B400)),
                ),
              ),
              Text('MIAW')
            ],
          ),
        ),
        Container(
          height: 45,
          color: Colors.black45,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: const Icon(
            Icons.close,
            color: Colors.white,
            size: 32,
          ),
        ),
      ]),
    );
  }
}
