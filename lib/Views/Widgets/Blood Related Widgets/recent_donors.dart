import 'package:earn_store/Controllers/Blood%20Controllers/recent_donation_controller.dart';
import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Utils/date_helpers.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RecentDonors extends StatelessWidget {
  const RecentDonors({super.key});

  @override
  Widget build(BuildContext context) {
    RecentDonationController controller = Get.put(RecentDonationController());
    return Obx(
      () {
        return Column(
          children: [
            titleBar(),
            SizedBox(height: 30.h),
            ListView.builder(
              itemCount: controller.recentDonations.value!.donations!.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return recentDonorBox(index: index);
              },
            ),
            SizedBox(height: 20.h),
          ],
        );
      },
    );
  }

  Widget titleBar() {
    return GlassmorphismCard(
      boxHeight: 50.h,
      borderRadius: 0,
      onPressed: () {},
      child: TextStyles.customText(
        title: "Those who recently donated blood",
      ),
    );
  }

  Widget recentDonorBox({required int index}) {
    RecentDonationController controller = Get.put(RecentDonationController());
    return Obx(
      () {
        String formattedDate = DateHelpers.formatDate(
          controller.recentDonations.value!.donations![index].donationDate
              .toString(),
        );
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 15.h,
          ),
          child: GlassmorphismCard(
            boxHeight: 150.h,
            verticalPadding: 10.h,
            horizontalPadding: 15.w,
            borderRadius: 75.r,
            child: Column(
              children: [
                nameWidget(index: index),
                SizedBox(height: 10.h),
                statusWidget(index: index),
                SizedBox(height: 10.h),
                TextStyles.customText(
                  title: "Date : $formattedDate",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget nameWidget({required int index}) {
    RecentDonationController controller = Get.put(RecentDonationController());
    return Obx(
      () {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextStyles.customText(
              title: "Congratulations!",
            ),
            SizedBox(height: 2.h),
            TextStyles.customText(
              title: controller
                  .recentDonations.value!.donations![index].donorName
                  .toString(),
            ),
          ],
        );
      },
    );
  }

  Widget statusWidget({required int index}) {
    RecentDonationController controller = Get.put(RecentDonationController());
    return Obx(
      () {
        return PaddedScreen(
          padding: 5.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextStyles.customText(
                title:
                    "Status : ${controller.recentDonations.value!.donations![index].status}",
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              Image.asset(
                "${Paths.iconPath}blood_drop.png",
                height: 30.h,
                width: 30.w,
                fit: BoxFit.fill,
              ),
              SizedBox(
                width: 130.w,
                child: TextStyles.customText(
                  title:
                      "Location: ${controller.recentDonations.value!.donations![index].place}",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
