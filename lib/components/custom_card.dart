import 'package:flutter/material.dart';

class CustomCardMainP extends StatelessWidget {
  final bool? dark;
  const CustomCardMainP({
    super.key,
    required this.dark,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://miro.medium.com/v2/resize:fit:720/format:webp/1*7nGWHF6Zvtw_Y2zSDhXrLg.jpeg'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.black38),
            child: null),
        Column(
          children: [
            const Expanded(flex: 4, child: SizedBox()),
            Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(right: 54.0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 12.0),
                        Text('MUMBALA ',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 48.0,
                                color: Colors.white,
                                height: 1.25)),
                        Text(
                            'Made From The Ember Of The Abyss, Dwelve Into The Sadness',
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.white)),
                        const SizedBox(height: 24.0),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.65,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: !dark!
                                ? Color(0xFF04B400)
                                : Color.fromRGBO(0, 116, 10, 1),
                          ),
                          child: Center(
                              child: Text(
                            'READ MORE',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          )),
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
