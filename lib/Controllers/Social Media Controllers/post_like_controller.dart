import 'package:earn_store/Networks/post_networks.dart';
import 'package:earn_store/Utils/local_storage.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class PostLikeController extends GetxController {
  RxBool likeLoading = false.obs;
  PostNetworks postNetworks = PostNetworks();
  Future<void> addLike({
    required String postID,
  }) async {
    likeLoading.value = true;
    int userID = await LocalStorage.getUserID();
    final response = await postNetworks.postDataWithoutResponse(
      url: "/add-like",
      body: {
        "post_id": postID,
        "user_id": userID.toString(),
      },
    );
    response.fold(
      (left) {
        likeLoading.value = false;
        Snackbars.unSuccessSnackBar(
          title: "Add Like Status",
          description: "Failed to add like",
        );
      },
      (commentData) async {
        likeLoading.value = false;
      },
    );
  }
}
