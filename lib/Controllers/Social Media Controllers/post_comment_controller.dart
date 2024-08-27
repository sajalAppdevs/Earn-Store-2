import 'package:earn_store/Models/Social%20Media%20Models/post_comment_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Networks/post_networks.dart';
import 'package:earn_store/Utils/local_storage.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class PostCommentController extends GetxController {
  RxBool commentLoading = true.obs;
  RxBool addCommentLoading = false.obs;
  final comments = Rxn<PostCommentModel>();
  GetNetworks getNetworks = GetNetworks();
  PostNetworks postNetworks = PostNetworks();
  Future<void> getPostComment({required String postID}) async {
    commentLoading.value = true;
    final response = await getNetworks.getData<PostCommentModel>(
      url: "/get-comments-post-id?post_id=$postID",
      fromJson: (json) => PostCommentModel.fromJson(json),
    );
    response.fold(
      (left) {
        Snackbars.unSuccessSnackBar(
          title: "Post Comment Status",
          description: left,
        );
        commentLoading.value = false;
      },
      (commentInfo) async {
        comments.value = commentInfo;
        commentLoading.value = false;
      },
    );
  }

  Future<void> sendMessage({
    required String postID,
    required String message,
  }) async {
    addCommentLoading.value = true;
    int userID = await LocalStorage.getUserID();
    final response = await postNetworks.postDataWithoutResponse(
      url: "/add-comment",
      body: {
        "post_id": postID.toString(),
        "user_id": userID.toString(),
        "text": message,
      },
    );
    response.fold(
      (left) {
        Snackbars.unSuccessSnackBar(
          title: "Add Comment Status",
          description: left,
        );
        addCommentLoading.value = false;
      },
      (loginData) async {
        addCommentLoading.value = false;
        await getPostComment(postID: postID);
      },
    );
  }
}
