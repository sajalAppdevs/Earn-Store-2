import 'package:earn_store/Models/Social%20Media%20Models/post_comment_model.dart';
import 'package:earn_store/Networks/get_networks.dart';
import 'package:earn_store/Utils/snackbars.dart';
import 'package:get/get.dart';

class PostCommentController extends GetxController {
  RxBool commentLoading = true.obs;
  final comments = Rxn<PostCommentModel>();
  GetNetworks getNetworks = GetNetworks();
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
}
