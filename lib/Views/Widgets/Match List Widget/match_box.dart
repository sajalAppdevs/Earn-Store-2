import 'package:earn_store/Controllers/Home%20Controllers/sport_update_controller.dart';
import 'package:earn_store/Models/Home%20Models/sport_update_model.dart';
import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Utils/date_helpers.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Common%20Widgets/network_image_widget.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MatchBox extends StatelessWidget {
  final int index;
  const MatchBox({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    SportUpdateController controller = Get.put(
      SportUpdateController(),
    );
    return Obx(
      () {
        SportUpdateModel sportUpdates = controller.sportUpdates.value!;
        String date = DateHelpers.formatDate(
          sportUpdates.posts![index].datetime.toString(),
        );
        String title = sportUpdates.posts![index].title.toString();
        String countryFlag1 =
            sportUpdates.posts![index].team1!.image.toString();
        String countryName1 = sportUpdates.posts![index].team1!.name.toString();
        String countryFlag2 =
            sportUpdates.posts![index].team2!.image.toString();
        String countryName2 = sportUpdates.posts![index].team2!.name.toString();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            TextStyles.customText(title: date),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10.h,
              ),
              child: GlassmorphismCard(
                boxHeight: 120.h,
                horizontalPadding: 15.h,
                verticalPadding: 15.w,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customText(title: title),
                        customText(title: date),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        countryBox(
                          flagPath: countryFlag1,
                          countryName: countryName1,
                        ),
                        Image.asset(
                          "${Paths.iconPath}vs.png",
                          height: 35.h,
                          width: 35.w,
                        ),
                        countryBox(
                          flagPath: countryFlag2,
                          countryName: countryName2,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget customText({required String title}) {
    return TextStyles.customText(
      title: title,
      fontSize: 13.sp,
      fontWeight: FontWeight.w500,
    );
  }

  Widget countryBox({
    required String flagPath,
    required String countryName,
  }) {
    return Row(
      children: [
        countryFlatImage(imagePath: flagPath),
        SizedBox(width: 8.w),
        TextStyles.customText(
          title: countryName,
          fontSize: 13.sp,
          fontWeight: FontWeight.w500,
        )
      ],
    );
  }

  Widget countryFlatImage({required String imagePath}) {
    return NetworkImageWidget(
      imageUrl: imagePath,
      loadingSize: 15.sp,
      height: 30.h,
      width: 35.w,
    );
  }
}
