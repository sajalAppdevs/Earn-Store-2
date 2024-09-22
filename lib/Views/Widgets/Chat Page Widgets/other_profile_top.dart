import 'package:cached_network_image/cached_network_image.dart';
import 'package:earn_store/Controllers/User%20Controllers/other_profile_controller.dart';
import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Utils/button_loading.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OtherProfileTop extends StatelessWidget {
  const OtherProfileTop({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassmorphismCard(
      boxHeight: 250.h,
      verticalPadding: 15.h,
      horizontalPadding: 20.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          userImage(),
          SizedBox(height: 10.h),
          userInfo(),
        ],
      ),
    );
  }

  Widget userImage() {
    OtherProfileController controller = Get.put(OtherProfileController());
    return Obx(
      () {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: CachedNetworkImage(
                imageUrl:
                    controller.otherProfile.value!.user!.imageUrl.toString(),
                imageBuilder: (context, imageProvider) => Container(
                  height: 128.h,
                  width: 128.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => const ButtonLoading(),
                errorWidget: (context, url, error) => Container(
                  height: 128.h,
                  width: 128.w,
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
              ),
            ),
          ],
        );
      },
    );
  }

  Widget userInfo() {
    OtherProfileController controller = Get.put(OtherProfileController());
    return Obx(
      () {
        String name = controller.otherProfile.value!.user!.name.toString();
        String email = controller.otherProfile.value!.user!.email.toString();
        return Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextStyles.customText(
                title: name,
                fontSize: 18.sp,
              ),
              SizedBox(height: 5.h),
              TextStyles.customText(
                title: email,
                fontSize: 14.sp,
              ),
            ],
          ),
        );
      },
    );
  }
}
