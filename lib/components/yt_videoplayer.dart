import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YtPlayerComp extends StatefulWidget {
  final double width;
  final double height;
  final String? idListItem;
  const YtPlayerComp(
      {super.key, required this.width, required this.height, this.idListItem});

  @override
  State<YtPlayerComp> createState() => _YtPlayerCompState();
}

class _YtPlayerCompState extends State<YtPlayerComp> {
  /*
  late final _controller = YoutubePlayerController.fromVideoId(
    videoId: widget.idListItem ?? 'a0X0YA6ZfW4',
    autoPlay: false,
    params: const YoutubePlayerParams(showFullscreenButton: true),
  );
*/
  @override
  Widget build(BuildContext context) {
    final controller = YoutubePlayerController.fromVideoId(
      videoId: widget.idListItem ?? 'a0X0YA6ZfW4',
      autoPlay: false,
      params: const YoutubePlayerParams(showFullscreenButton: false),
    );
    return SizedBox(
        width: widget.width,
        height: widget.height,
        child: YoutubePlayerScaffold(
            builder: (context, player) => player, controller: controller));
  }
}
