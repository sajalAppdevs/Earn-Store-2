import 'package:cached_network_image/cached_network_image.dart';
import 'package:earn_store/Controllers/Social%20Media%20Controllers/solo_messege_controller.dart';
import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Utils/button_loading.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SoloChatDetailsTop extends StatelessWidget {
  const SoloChatDetailsTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 10.h,
        bottom: 20.h,
        left: 10.w,
        right: 10.w,
      ),
      child: GlassmorphismCard(
        boxHeight: 65.h,
        boxLeftPadding: 15.w,
        boxRightPadding: 8.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                chatImage(),
                SizedBox(width: 10.w),
                userName(),
              ],
            ),
            // IconButton(
            //   onPressed: () {},
            //   icon: Icon(
            //     Icons.more_vert,
            //     color: TextColors.textColor4,
            //     size: 30.sp,
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  Widget chatImage() {
    return CachedNetworkImage(
      imageUrl: "",
      imageBuilder: (context, imageProvider) => Container(
        height: 40.h,
        width: 40.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => ButtonLoading(
        loadingSize: 15.sp,
      ),
      errorWidget: (context, url, error) => Container(
        height: 40.h,
        width: 40.w,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(
              "${Paths.imagePath}blank_image.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget userName() {
    SoloMessegeController controller = Get.put(SoloMessegeController());
    return Obx(
      () {
        String senderName = controller.nameSelector();
        return SizedBox(
          width: 220.w,
          child: TextStyles.customText(
            title: senderName,
            fontSize: 14.sp,
            textAlign: TextAlign.left,
          ),
        );
      },
    );
  }
}
