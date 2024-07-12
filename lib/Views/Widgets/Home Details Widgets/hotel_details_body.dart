import 'package:earn_store/Statics/colors.dart';
import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Styles/buttons.dart';
import 'package:earn_store/Views/Styles/padding.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HotelDetailsBody extends StatelessWidget {
  const HotelDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedScreen(
      padding: 10.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          hotelInfoCard(),
          SizedBox(height: 20.h),
          TextStyles.customText(
            title: "Select Room",
          ),
          SizedBox(height: 10.h),
          ListView.builder(
            itemCount: 2,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return roomWidget(index: index);
            },
          ),
          SizedBox(height: 30.h),
          buttonRow(),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }

  Widget hotelInfoCard() {
    return GlassmorphismCard(
      boxHeight: 195.h,
      verticalPadding: 15.h,
      horizontalPadding: 20.w,
      child: Column(
        children: [
          TextStyles.customText(
            title: "Sea pearl Beach Resort & Spa Cox’s Bazar",
            isShowAll: true,
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.location_on,
                size: 20.sp,
                color: TextColors.textColor1,
              ),
              SizedBox(width: 2.w),
              SizedBox(
                height: 40.h,
                width: 275.w,
                child: TextStyles.customText(
                  title: "Sea pearl Beach Resort & Spa Cox’s Bazar",
                  isShowAll: true,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          reviewWidget(),
        ],
      ),
    );
  }

  Widget reviewWidget() {
    return GlassmorphismCard(
      boxHeight: 50.h,
      boxWidth: Get.width,
      horizontalPadding: 20.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextStyles.customText(
                title: "4.8",
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(width: 5.w),
              Image.asset(
                "${Paths.iconPath}star.png",
                height: 17.h,
                width: 17.w,
                fit: BoxFit.fill,
              )
            ],
          ),
          TextStyles.customText(
            title: "11 Reviews",
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextStyles.customText(
                title: "12",
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(width: 5.w),
              Image.asset(
                "${Paths.iconPath}heart.png",
                height: 21.h,
                width: 21.w,
                fit: BoxFit.fill,
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget roomWidget({required int index}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: GlassmorphismCard(
        boxHeight: 130.h,
        verticalPadding: 20.h,
        horizontalPadding: 12.w,
        child: Row(
          children: [
            Container(
              height: 90.h,
              width: 110.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.r),
                image: const DecorationImage(
                  image: AssetImage("${Paths.imagePath}hotel.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40.h,
                      width: 120.w,
                      child: TextStyles.customText(
                        title: "Sea Pearl 2nd Floor",
                        isShowAll: true,
                        textAlign: TextAlign.left,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(
                      width: 70.w,
                      child: TextStyles.customText(
                        title: "\$45/Night",
                        isShowAll: true,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                      height: 30.h,
                      width: 90.w,
                      onPressed: () {},
                      buttonText: "2 Bedroom",
                      textSize: 12.sp,
                    ),
                    SizedBox(width: 10.w),
                    CustomButton(
                      height: 30.h,
                      width: 90.w,
                      onPressed: () {},
                      buttonText: "Free Wifi",
                      textSize: 12.sp,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buttonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomButton(
          width: 150.w,
          onPressed: () {},
          buttonText: "Refer",
        ),
        CustomButton(
          width: 150.w,
          onPressed: () {},
          buttonText: "Book",
        ),
      ],
    );
  }
}
