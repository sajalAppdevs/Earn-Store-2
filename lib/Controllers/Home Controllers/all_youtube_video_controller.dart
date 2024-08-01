import 'package:earn_store/Models/Home%20Models/all_youtube_video_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Networks/post_networks.dart';
import 'package:earn_store/Utils/local_storage.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class AllYoutubeVideoController extends GetxController {
  final videos = Rxn<AllYoutubeVideoModel>();
  GetNetworks getNetworks = GetNetworks();
  PostNetworks postNetworks = PostNetworks();
  Future<void> getAllYoutubeVideos() async {
    int userID = await LocalStorage.getUserID();
    final response = await getNetworks.getData<AllYoutubeVideoModel>(
      url: "/get-youtube-videos?user_id=$userID",
      fromJson: (json) => AllYoutubeVideoModel.fromJson(json),
    );
    response.fold(
      (left) {
        Snackbars.unSuccessSnackBar(
          title: "Youtube Video Status",
          description: left,
        );
      },
      (videoData) async {
        videos.value = videoData;
      },
    );
  }

  Future<void> addSeenVideo({required String videoID}) async {
    int userID = await LocalStorage.getUserID();
    final response = await postNetworks.postDataWithoutResponse(
      url: "/add-seen-youtube-video?user_id=$userID&video_id=$videoID",
      body: {},
    );
    response.fold(
      (left) {
        Snackbars.unSuccessSnackBar(
          title: "Add Seen Video Status",
          description: left,
        );
      },
      (addingStatus) {},
    );
  }
}
