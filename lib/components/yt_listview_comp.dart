import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:recipe_app/components/yt_videoplayer.dart';
import 'package:recipe_app/youtube_scraper.dart';

class ListYtComp extends StatefulWidget {
  final double height;
  final String? title;
  const ListYtComp({super.key, required this.height, this.title});

  @override
  ListYtCompState createState() => ListYtCompState();
}

class ListYtCompState extends State<ListYtComp> {
  Future<List<String?>> isolateYoutubeGetListWrapperTest() async {
    return await Isolate.run(() => ['BhGZkdODoDM']);
  }

  Future<List<String?>> testingForMeow() async {
    final receivePort = ReceivePort();

    await Isolate.spawn(getListYoutubeVideoIdIsolate,
        [receivePort.sendPort, widget.title ?? 'BhGZkdODoDM']);

    return await receivePort.first as List<String?>;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: testingForMeow(),
        builder: (context, AsyncSnapshot<List<String?>> snapshot) {
          if (snapshot.hasData) {
            return PageView.builder(
                physics: const PageScrollPhysics(),
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) => ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: YtPlayerComp(
                        width: MediaQuery.of(context).size.width,
                        height: widget.height,
                        idListItem: snapshot.data?[index] ?? '',
                      ),
                    )).animate().fade();
          } else if (snapshot.hasError) {
            return SizedBox(
              height: widget.height,
              child: const Center(
                child: Text('Something Gone Wrong'),
              ),
            );
          } else {
            return SizedBox(
              height: widget.height,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Container(
                      color: Colors.black87,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ).animate().fadeOut(),
                ],
              ),
            );
          }
        });
  }
}
