import 'package:earn_store/Models/Home%20Models/all_video_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Networks/post_networks.dart';
import 'package:earn_store/Utils/local_storage.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class AllVideoController extends GetxController {
  final videos = Rxn<AllVideoModel>();
  GetNetworks getNetworks = GetNetworks();
  PostNetworks postNetworks = PostNetworks();
  Future<void> getAllVideos() async {
    int userID = await LocalStorage.getUserID();
    final response = await getNetworks.getData<AllVideoModel>(
      url: "/get-videos?user_id=$userID",
      fromJson: (json) => AllVideoModel.fromJson(json),
    );
    response.fold(
      (left) {
        Snackbars.unSuccessSnackBar(
          title: "General Video Status",
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
      url: "/add-seen-video?user_id=$userID&video_id=$videoID",
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
