import 'package:cached_network_image/cached_network_image.dart';
import 'package:earn_store/Controllers/Home%20Controllers/sport_update_controller.dart';
import 'package:earn_store/Models/Home%20Models/sport_update_model.dart';
import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Utils/button_loading.dart';
import 'package:earn_store/Utils/date_formatter.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Pages/Match%20Pages/match_list_page.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:earn_store/Views/Styles/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeMatch extends StatelessWidget {
  const HomeMatch({super.key});

  @override
  Widget build(BuildContext context) {
    SportUpdateController controller = Get.put(SportUpdateController());
    return Obx(
      () {
        return controller.sportLoading.value
            ? ButtonLoading(
                verticalPadding: 50.h,
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleText(
                    title: "Sport Update",
                    onPressed: () {
                      Get.to(
                        const MatchListPage(),
                      );
                    },
                  ),
                  SizedBox(height: 10.h),
                  ListView.builder(
                    itemCount:
                        controller.sportUpdates.value!.sportUpdate!.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return matchBox(index: index);
                    },
                  )
                ],
              );
      },
    );
  }

  Widget matchBox({required int index}) {
    SportUpdateController controller = Get.put(SportUpdateController());
    return Obx(
      () {
        SportUpdateModel sportUpdates = controller.sportUpdates.value!;
        String date = DateFormatter.formatDate(
          sportUpdates.sportUpdate![index].datetime.toString(),
        );
        String title = sportUpdates.sportUpdate![index].title.toString();
        String countryFlag1 =
            sportUpdates.sportUpdate![index].team1!.image.toString();
        String countryName1 =
            sportUpdates.sportUpdate![index].team1!.name.toString();
        String countryFlag2 =
            sportUpdates.sportUpdate![index].team2!.image.toString();
        String countryName2 =
            sportUpdates.sportUpdate![index].team2!.name.toString();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
    return CachedNetworkImage(
      imageUrl: imagePath,
      imageBuilder: (context, imageProvider) => Container(
        height: 30.h,
        width: 35.w,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.fill,
          ),
        ),
      ),
      placeholder: (context, url) => ButtonLoading(
        loadingColor: TextColors.textColor1,
        loadingSize: 15.sp,
      ),
      errorWidget: (context, url, error) => Container(
        height: 30.h,
        width: 35.w,
        color: Colors.grey,
      ),
    );
  }
}
