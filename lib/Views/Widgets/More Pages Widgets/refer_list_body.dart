import 'package:cached_network_image/cached_network_image.dart';
import 'package:earn_store/Controllers/User%20Controllers/refer_list_controller.dart';
import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Utils/button_loading.dart';
import 'package:earn_store/Utils/local_storage.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Chat%20Pages/other_profile_page.dart';
import 'package:earn_store/Views/Pages/More%20Pages/profile_page.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ReferListBody extends StatelessWidget {
  const ReferListBody({super.key});

  @override
  Widget build(BuildContext context) {
    ReferListController controller = Get.put(ReferListController());
    return Obx(
      () {
        return ListView.builder(
          itemCount: controller.refers.value!.refers!.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return referBox(index: index);
          },
        );
      },
    );
  }

  Widget referBox({required int index}) {
    ReferListController controller = Get.put(ReferListController());
    int rank = index + 1;
    return Obx(
      () {
        return Padding(
          padding: EdgeInsets.only(bottom: 15.h),
          child: GlassmorphismCard(
            boxHeight: 50.h,
            horizontalPadding: 15.w,
            onPressed: () async {
              int userID = await LocalStorage.getUserID();
              controller.refers.value!.refers![index].userid!.toInt() == userID
                  ? Get.to(
                      const ProfilePage(),
                    )
                  : Get.to(
                      OtherProfilePage(
                        userID: controller.refers.value!.refers![index].userid
                            .toString(),
                      ),
                    );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customText(
                  title: rank.toString(),
                ),
                nameAndImage(index: index),
                customText(
                  title:
                      controller.refers.value!.refers![index].refers.toString(),
                ),
                customText(
                  title:
                      controller.refers.value!.refers![index].point.toString(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget nameAndImage({required int index}) {
    ReferListController controller = Get.put(ReferListController());
    return Obx(
      () {
        return Row(
          children: [
            CachedNetworkImage(
              imageUrl:
                  controller.refers.value!.refers![index].imageUrl.toString(),
              imageBuilder: (context, imageProvider) => Container(
                height: 25.h,
                width: 25.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => ButtonLoading(loadingSize: 12.sp),
              errorWidget: (context, url, error) => Container(
                height: 25.h,
                width: 25.w,
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
            SizedBox(width: 2.w),
            SizedBox(
              width: 125.w,
              child: TextStyles.customText(
                title: controller.refers.value!.refers![index].name.toString(),
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.left,
              ),
            )
          ],
        );
      },
    );
  }

  Widget customText({required String title}) {
    return TextStyles.customText(
      title: title,
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
    );
  }
}
