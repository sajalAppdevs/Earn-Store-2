import 'package:earn_store/Controllers/Social%20Media%20Controllers/post_comment_controller.dart';
import 'package:earn_store/Utils/screen_loading.dart';
import 'package:earn_store/Views/Pages/Splash%20&%20Auth%20Pages/root_design.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Widgets/Feed%20Page%20Widgets/all_comment_body.dart';
import 'package:earn_store/Views/Widgets/Feed%20Page%20Widgets/all_comment_bottom.dart';
import 'package:earn_store/Views/Widgets/Feed%20Page%20Widgets/all_comment_top.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AllCommentPage extends StatefulWidget {
  final String postID;
  const AllCommentPage({super.key, required this.postID});

  @override
  State<AllCommentPage> createState() => _AllCommentPageState();
}

class _AllCommentPageState extends State<AllCommentPage> {
  PostCommentController controller = Get.put(PostCommentController());
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    await controller.getPostComment(postID: widget.postID);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return controller.commentLoading.value
            ? const ScreenLoading()
            : RootDesign(
                child: PaddedScreen(
                  child: Column(
                    children: [
                      const AllCommentTop(),
                      const AllCommentBody(),
                      SizedBox(height: 20.h),
                      const AllCommentBottom(),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              );
      },
    );
  }
}
