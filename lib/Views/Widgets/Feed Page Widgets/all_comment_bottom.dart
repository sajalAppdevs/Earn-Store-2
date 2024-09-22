import 'package:earn_store/Controllers/Social%20Media%20Controllers/post_comment_controller.dart';
import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Utils/button_loading.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AllCommentBottom extends StatelessWidget {
  final String postID;
  const AllCommentBottom({super.key, required this.postID});

  @override
  Widget build(BuildContext context) {
    TextEditingController messegeController = TextEditingController();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        messegeField(messegeController: messegeController),
        sendButton(
          messegeController: messegeController,
        ),
      ],
    );
  }

  Widget messegeField({required TextEditingController messegeController}) {
    return GlassmorphismCard(
      boxHeight: 45.h,
      boxWidth: 210.w,
      borderRadius: 30.r,
      horizontalPadding: 20.w,
      child: TextField(
        controller: messegeController,
        style: TextStyles.fieldTextStyle(),
        decoration: InputDecoration(
          hintText: "Comment as Admin",
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintStyle: TextStyles.fieldHintStyle(),
        ),
      ),
    );
  }

  Widget sendButton({required TextEditingController messegeController}) {
    PostCommentController controller = Get.put(PostCommentController());
    return Obx(
      () {
        return controller.addCommentLoading.value
            ? Padding(
                padding: EdgeInsets.only(right: 20.w),
                child: const ButtonLoading(),
              )
            : GlassmorphismCard(
                boxHeight: 45.h,
                boxWidth: 100.w,
                borderRadius: 30.r,
                horizontalPadding: 20.w,
                onPressed: () async {
                  if (messegeController.text.isEmpty) {
                  } else {
                    await controller.addComment(
                      postID: postID,
                      comment: messegeController.text,
                    );
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextStyles.customText(
                      title: "Send",
                      fontSize: 12.sp,
                    ),
                    Image.asset(
                      "${Paths.iconPath}send.png",
                      height: 16.h,
                      width: 16.w,
                      fit: BoxFit.fill,
                    )
                  ],
                ),
              );
      },
    );
  }
}
