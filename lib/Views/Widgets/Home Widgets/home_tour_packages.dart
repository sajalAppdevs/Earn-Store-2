import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:earn_store/Views/Styles/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTourPackages extends StatelessWidget {
  const HomeTourPackages({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleText(
          title: "Tour Package",
          onPressed: () {},
        ),
        SizedBox(height: 70.h),
        Container(
          height: 150.h,
          clipBehavior: Clip.none,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              SingleChildScrollView(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                child: Stack(
                  children: [
                    Row(
                      children: List.generate(
                        3,
                        (index) {
                          return tourBox(index: index);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget tourBox({required int index}) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 35.w),
          child: GlassmorphismCard(
            boxHeight: 105.h,
            boxWidth: 250.w,
            child: Column(
              children: [
                topInfo(index: index),
              ],
            ),
          ),
        ),
        tourImage(index: index),
      ],
    );
  }

  Widget tourImage({required int index}) {
    return Positioned(
      top: -30,
      left: 20.w,
      child: Container(
        clipBehavior: Clip.none,
        height: 95.h,
        width: 110.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          image: const DecorationImage(
            image: AssetImage(
              "${Paths.imagePath}tour.jpg",
            ),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  Widget topInfo({required int index}) {
    return Padding(
      padding: EdgeInsets.only(
        left: 15.w,
        right: 10.w,
        top: 10.h,
        bottom: 10.h,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 80.w),
              SizedBox(
                width: 80.w,
                child: TextStyles.customText(
                  title: "3 Days in Bali",
                  fontSize: 12.sp,
                  isShowAll: true,
                ),
              ),
              SizedBox(
                width: 50.w,
                child: TextStyles.customText(
                  title: "\$45",
                  fontSize: 10.sp,
                ),
              )
            ],
          ),
          detailsButton(index: index),
        ],
      ),
    );
  }

  Widget detailsButton({required int index}) {
    return Align(
      alignment: Alignment.centerRight,
      child: GlassmorphismCard(
        boxHeight: 30.h,
        boxWidth: 80.w,
        onPressed: () {},
        child: TextStyles.customText(
          title: "Details",
          fontSize: 10.sp,
        ),
      ),
    );
  }
}
