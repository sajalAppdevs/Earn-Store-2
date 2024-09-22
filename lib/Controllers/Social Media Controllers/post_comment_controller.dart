import 'package:earn_store/Models/Social%20Media%20Models/add_comment_model.dart';
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

  Future<void> addComment({
    required String postID,
    required String comment,
  }) async {
    addCommentLoading.value = true;
    int userID = await LocalStorage.getUserID();
    final response = await postNetworks.postData<AddCommentModel>(
      fromJson: (json) => AddCommentModel.fromJson(json),
      url: "/add-comment",
      body: {
        "post_id": postID,
        "user_id": userID.toString(),
        "comment_text": comment,
      },
    );
    response.fold(
      (left) {
        addCommentLoading.value = false;
        Snackbars.unSuccessSnackBar(
          title: "Add Comment Status",
          description: "Failed to add Comment",
        );
      },
      (commentData) async {
        addCommentLoading.value = false;
        await getPostComment(postID: postID);
      },
    );
  }
}
