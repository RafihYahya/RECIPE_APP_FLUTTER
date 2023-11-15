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
