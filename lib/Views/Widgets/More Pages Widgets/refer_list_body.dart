import 'package:earn_store/Statics/paths.dart';
import 'package:earn_store/Views/Common%20Widgets/glass_morphism_card.dart';
import 'package:earn_store/Views/Styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReferListBody extends StatelessWidget {
  const ReferListBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 15,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return referBox(index: index);
      },
    );
  }

  Widget referBox({required int index}) {
    int rank = index + 1;
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: GlassmorphismCard(
        boxHeight: 50.h,
        horizontalPadding: 15.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            customText(
              title: rank.toString(),
            ),
            nameAndImage(),
            customText(
              title: "9",
            ),
            customText(
              title: "1875",
            ),
          ],
        ),
      ),
    );
  }

  Widget nameAndImage() {
    return Row(
      children: [
        Container(
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
        SizedBox(width: 2.w),
        SizedBox(
          width: 125.w,
          child: TextStyles.customText(
            title: "Rashidatul Kobra",
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.left,
          ),
        )
      ],
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
