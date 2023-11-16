import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:recipe_app/components/yt_videoplayer.dart';
import 'package:recipe_app/youtube_scraper.dart';

class ListYtComp extends StatefulWidget {
  final double height;
  final String? title;
  ListYtComp({Key? key, required this.height, this.title}) : super(key: key);

  @override
  _ListYtCompState createState() => _ListYtCompState();
}

class _ListYtCompState extends State<ListYtComp> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getListYoutubeVideoId(widget.title ?? 'BhGZkdODoDM'),
        builder: (context, AsyncSnapshot<List<String?>> snapshot) {
          if (snapshot.hasData) {
            return PageView.builder(
                physics: PageScrollPhysics(),
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) => YtPlayerComp(
                      width: MediaQuery.of(context).size.width,
                      height: widget.height,
                      idListItem: snapshot.data?[index] ?? '',
                    ).animate().fade());
          } else if (snapshot.hasError) {
            return SizedBox(
              height: widget.height,
              child: const Center(
                child: Text('Something Gone Wrong'),
              ),
            ).animate().fade();
          } else {
            return SizedBox(
              height: widget.height,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ).animate().fade();
          }
        });
  }
}
