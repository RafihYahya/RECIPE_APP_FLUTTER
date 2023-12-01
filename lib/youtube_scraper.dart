import 'dart:async';
import 'dart:isolate';

import 'package:youtube_scrape_api/models/video.dart';
import 'package:youtube_scrape_api/youtube_scrape_api.dart';

Future<List<String?>> getListYoutubeVideoId(String searchquery) async {
  YoutubeDataApi youtubeDataApi = YoutubeDataApi();
  List videoResult = await youtubeDataApi.fetchSearchVideo(searchquery);
  var myList = [
    for (var element in videoResult)
      if (element is Video) element.videoId
  ];

  return myList;
}

void getListYoutubeVideoIdIsolate(List<Object> arguments) async {
  SendPort sendPort = arguments[0] as SendPort;
  String myString = arguments[1] as String;
  YoutubeDataApi youtubeDataApi = YoutubeDataApi();
  List videoResult = await youtubeDataApi.fetchSearchVideo(myString);
  var myList = [
    for (var element in videoResult)
      if (element is Video) element.videoId
  ];
  sendPort.send(myList);
}
